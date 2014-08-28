require 'net/http'
require 'json'

require_relative "classes/ZiggeoConfig"
require_relative "classes/ZiggeoConnect"
require_relative "classes/ZiggeoVideos"
require_relative "classes/ZiggeoStreams"
require_relative "classes/ZiggeoAuthtokens"
require_relative "classes/ZiggeoAuth"

# When converting to a gem, include this: https://github.com/nicksieger/multipart-post

class Ziggeo
  
  attr_accessor :token, :private_key, :encryption_key, :config, :connect
  
  def initialize(token = nil, private_key = nil, encryption_key = nil)
    @token = token.nil? ? ENV['ZIGGEO_TOKEN'] : token
    @private_key = private_key.nil? ? ENV['ZIGGEO_PRIVATE_KEY'] : private_key
    @encryption_key = encryption_key.nil? ? ENV['ZIGGEO_ENCRYPTION_KEY'] : encryption_key
    @config = ZiggeoConfig.new()
    @connect = ZiggeoConnect.new(self)
    @videos = nil
    @streams = nil
    @authtokens = nil
    @auth = nil
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