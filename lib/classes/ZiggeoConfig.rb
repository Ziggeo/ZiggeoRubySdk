
class ZiggeoConfig
  attr_accessor :request_timeout, :request_timeout_per_mb, :server_api_url, :api_url, :cdn_url, :js_cdn_url, :regions, :api_regions, :cdn_regions, :js_cdn_regions, :resilience_factor, :resilience_on_fail

  def initialize()
    @request_timeout = 30 # seconds
    @request_timeout_per_mb = 20 # seconds per MB of uploaded file
    @server_api_url = "https://srv-api.ziggeo.com"
    @api_url = "https://api-us-east-1.ziggeo.com"
    @cdn_url = "https://video-cdn.ziggeo.com"
    @js_cdn_url = "https://media-cdn.ziggeo.com"
    @regions = {"r1" => "https://srv-api-eu-west-1.ziggeo.com", }
    @api_regions = {"r1" => "https://api-eu-west-1.ziggeo.com", }
    @cdn_regions = {"r1" => "https://video-cdn-eu-west-1.ziggeo.com", }
    @js_cdn_regions = {"r1" => "https://media-cdn-eu-west-1.ziggeo.com", }
    @resilience_factor = 5
    @resilience_on_fail = {"error" => "Too many failed attempts"}
  end
end
