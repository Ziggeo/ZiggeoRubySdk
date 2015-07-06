require 'net/http'
require 'json'
require 'httparty'

class ZiggeoConnect
  def initialize(application)
    @application = application
  end

  def request(method, path, data = nil, file = nil)
    url = URI.parse(@application.config.server_api_url + '/v1' + path)
    auth = { username: @application.token, password: @application.private_key }
    method.downcase!
    allowed_methods = %w(get post delete)
    return unless allowed_methods.include?(method)
    HTTParty.send(method, url.to_s, body: data, basic_auth: auth).body
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

end
