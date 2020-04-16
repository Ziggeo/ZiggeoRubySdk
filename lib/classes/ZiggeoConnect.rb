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
    if (file.nil?)
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
    else
      data = data.nil? ? {} : data;
      data["file"] = File.new(file)
      timeout_in_seconds = ( ( File.size(file).to_f / 2**20 ).ceil * @application.config.request_timeout_per_mb.to_i ).to_i;

      begin
        HTTParty.send(method, url.to_s, body: data, basic_auth: auth, timeout: timeout_in_seconds)
      rescue Net::ReadTimeout => error
        self.timeout_error_message timeout_in_seconds, error
      end
    end
  end

  def request(method, path, data = nil, file = nil)
    res = nil
    5.times do
      res = self.singleRequest(method, path, data, file)
      break if res.response.code.to_i < 500
    end

    return res.body
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

  protected

  def timeout_error_message( timeout_in_seconds, error )
    puts "Error source: " + error.message
    puts "Server not responding. Host: #{@application.config.server_api_url} not responded in #{timeout_in_seconds} seconds."
    exit(1)
  end

end
