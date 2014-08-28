class ZiggeoConfig
  attr_accessor :local, :server_api_url

  def initialize()
    @local = false 
    @server_api_url = ENV['ZIGGEO_URL'].nil? ? "https://srvapi.ziggeo.com" : ENV['ZIGGEO_URL']
  end
end
