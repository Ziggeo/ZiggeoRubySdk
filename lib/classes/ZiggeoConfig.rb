class ZiggeoConfig
  attr_accessor :local, :server_api_url

  def initialize()
    @local = false 
    @server_api_url = "https://srvapi.ziggeo.com"
  end
end
