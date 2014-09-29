require 'net/http'
require 'json'
require 'uri'
require 'cgi'

require_relative "classes/ZiggeoConfig"
require_relative "classes/ZiggeoConnect"
require_relative "classes/ZiggeoVideos"
require_relative "classes/ZiggeoStreams"
require_relative "classes/ZiggeoAuthtokens"
require_relative "classes/ZiggeoAuth"

# TODO: https://github.com/nicksieger/multipart-post

class Ziggeo

  attr_accessor :token, :private_key, :encryption_key, :config, :connect
  def initialize(token = nil, private_key = nil, encryption_key = nil)
    @token = token
    @private_key = private_key
    @encryption_key = encryption_key
    @config = ZiggeoConfig.new()
    @connect = ZiggeoConnect.new(self)
    @videos = nil
    @streams = nil
    @authtokens = nil
    @auth = nil
    if (ENV["ZIGGEO_URL"] != nil)
      uri = URI.parse(ENV["ZIGGEO_URL"])
      @config.server_api_url = uri.scheme + "://" + uri.host + ":" + uri.port.to_s
      @token = uri.user
      @private_key = uri.password
      query = CGI::parse(uri.query)
      @encryption_key = query["encryption_key"]
    end
  end

  def videos()
    if (@videos == nil)
      @videos = ZiggeoVideos.new(self)
    end
    return @videos
  end

  def streams()
    if (@streams == nil)
      @streams = ZiggeoStreams.new(self)
    end
    return @streams
  end

  def authtokens()
    if (@authtokens == nil)
      @authtokens = ZiggeoAuthtokens.new(self)
    end
    return @authtokens
  end

  def auth()
    if (@auth == nil)
      @auth = ZiggeoAuth.new(self)
    end
    return @auth
  end

end