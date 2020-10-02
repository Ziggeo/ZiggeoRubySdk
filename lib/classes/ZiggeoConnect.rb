require 'net/http'
require 'json'
require 'httparty'

class ZiggeoConnect
  def initialize(application, baseuri)
    @application = application
    @baseuri = baseuri
  end

  def singleRequest(method, path, data = nil, file = nil)
    url = URI.parse(@baseuri + path)
    auth = { username: @application.token, password: @application.private_key }
    timeout_in_seconds = @application.config.request_timeout.to_i

    method.downcase!
    allowed_methods = %w(get post delete)
    return unless allowed_methods.include?(method)
    unless (file.nil?)
      data = data || {}
      data["file"] = File.new(file)
      timeout_in_seconds = ( ( File.size(file).to_f / 2**20 ).ceil * @application.config.request_timeout_per_mb.to_i ).to_i;
    end
    if (method == "get")
      begin
        HTTParty.send(method, url.to_s, query: data, basic_auth: auth, timeout: timeout_in_seconds)
      rescue Net::ReadTimeout => error
        self.timeout_error_message timeout_in_seconds, error
      end
    else
      begin
        HTTParty.send(method, url.to_s, body: data, basic_auth: auth, timeout: timeout_in_seconds)
      rescue Net::ReadTimeout => error
        self.timeout_error_message timeout_in_seconds, error
      end
    end
  end

  def request(method, path, data = nil, file = nil)
    res = nil
    @application.config.resilience_factor.times do
      res = self.singleRequest(method, path, data, file)
      if res.response.code.to_i >= 200 && res.response.code.to_i < 500
        return res.body
      end
    end
    return @application.config.resilience_on_fail.to_json
  end

  def requestJSON(method, path, data = nil, file = nil)
    return JSON.parse(self.request(method, path, data, file))
  end

  def get(path, data = nil, file = nil)
    return self.request("GET", path, data, file)
  end

  def getJSON(path, data = nil, file = nil)
    return self.requestJSON("GET", path, data, file)
  end

  def post(path, data = nil, file = nil)
    return self.request("POST", path, data, file)
  end

  def postJSON(path, data = nil, file = nil)
    return self.requestJSON("POST", path, data, file)
  end

  def delete(path, data = nil, file = nil)
    return self.request("DELETE", path, data, file)
  end

  def deleteJSON(path, data = nil, file = nil)
    return self.requestJSON("DELETE", path, data, file)
  end

  def uploadFile(url, file, data)
    res = nil
    data["file"] = File.new(file)
    timeout_in_seconds = ( ( File.size(file).to_f / 2**20 ).ceil * @application.config.request_timeout_per_mb.to_i ).to_i;
    begin
      @application.config.resilience_factor.times do
        res = HTTParty.send("post", url.to_s, body: data, timeout: timeout_in_seconds)
        if res.response.code.to_i >= 200 && res.response.code.to_i < 300
          return
        end
      end
      raise Exception.new res.response
    rescue Net::ReadTimeout => error
      self.timeout_error_message timeout_in_seconds, error
    end
  end

  def postUploadJSON(path, scope, data = nil, file = nil, type_key = nil)
    data = data || {}
    if type_key && (file.is_a? String)
      data[type_key] = File.extname(file)
    end
    result = self.postJSON(path, data)
    self.uploadFile(result["url_data"]["url"], file, result["url_data"]["fields"])
    return result[scope]
  end

  protected

  def timeout_error_message( timeout_in_seconds, error )
    puts "Error source: " + error.message
    puts "Server not responding. Host: #{@application.config.server_api_url} not responded in #{timeout_in_seconds} seconds."
    exit(1)
  end

end
