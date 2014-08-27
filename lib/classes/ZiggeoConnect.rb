require 'net/http'
require 'json'

class ZiggeoConnect
  
  def initialize(application)
    @application = application
  end
  
  def request(method, path, data = nil, file = nil)
    url = URI.parse(@application.config.server_api_url + '/v1' + path)
    if (method == "GET")
      if (data != nil)
        url.query = URI.encode_www_form(data)
      end
      req = Net::HTTP::Get.new(url.to_s)
    elsif (method == "POST")
      req = Net::HTTP::Post.new(url.to_s)
      if (data != nil)
        req.req.set_form_data(data)
      end
    elsif (method == "DELETE")
      req = Net::HTTP::Delete.new(url.to_s)
      if (data != nil)
        req.req.set_form_data(data)
      end
    end
    req.basic_auth(@application.token, @application.private_key)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    return res.body
  end
  
  def requestJSON(method, path, data = nil, file = nil)
    return JSON.parse self.request(method, path, data, file)
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
