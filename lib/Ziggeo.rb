require 'net/http'
require 'json'
require 'uri'
require 'cgi'

require_relative "classes/ZiggeoConfig"
require_relative "classes/ZiggeoConnect"
require_relative "classes/ZiggeoAuth"
require_relative "classes/ZiggeoVideos"
require_relative "classes/ZiggeoStreams"
require_relative "classes/ZiggeoAuthtokens"
require_relative "classes/ZiggeoApplication"
require_relative "classes/ZiggeoEffectProfiles"
require_relative "classes/ZiggeoEffectProfileProcess"
require_relative "classes/ZiggeoMetaProfiles"
require_relative "classes/ZiggeoMetaProfileProcess"
require_relative "classes/ZiggeoWebhooks"
require_relative "classes/ZiggeoAnalytics"

class Ziggeo

    attr_accessor :token, :private_key, :encryption_key, :config, :connect, :api_connect

    def initialize(token = nil, private_key = nil, encryption_key = nil)
        @token = token
        @private_key = private_key
        @encryption_key = encryption_key
        @config = ZiggeoConfig.new()
        server_api_url = @config.server_api_url
        regions = @config.regions
        regions.each do |key, value|
            if (@token.start_with?(key))
                server_api_url = value
            end
        end
        @connect = ZiggeoConnect.new(self, server_api_url)
        api_url = @config.api_url
        api_regions = @config.api_regions
        api_regions.each do |key, value|
            if (@token.start_with?(key))
                api_url = value
            end
        end
        @api_connect = ZiggeoConnect.new(self, api_url)
        @auth = nil
        @videos = nil
        @streams = nil
        @authtokens = nil
        @application = nil
        @effectProfiles = nil
        @effectProfileProcess = nil
        @metaProfiles = nil
        @metaProfileProcess = nil
        @webhooks = nil
        @analytics = nil
        if (ENV["ZIGGEO_URL"] != nil)
            uri = URI.parse(ENV["ZIGGEO_URL"])
            @config.server_api_url = uri.scheme + "://" + uri.host + ":" + uri.port.to_s
            @token = uri.user
            @private_key = uri.password
            query = CGI::parse(uri.query)
            @encryption_key = query["encryption_key"]
        end
    end

    def auth()
        if (@auth == nil)
            @auth = ZiggeoAuth.new(self)
        end
        return @auth    end

    def videos()
        if (@videos == nil)
            @videos = ZiggeoVideos.new(self)
        end
        return @videos    end

    def streams()
        if (@streams == nil)
            @streams = ZiggeoStreams.new(self)
        end
        return @streams    end

    def authtokens()
        if (@authtokens == nil)
            @authtokens = ZiggeoAuthtokens.new(self)
        end
        return @authtokens    end

    def application()
        if (@application == nil)
            @application = ZiggeoApplication.new(self)
        end
        return @application    end

    def effectProfiles()
        if (@effectProfiles == nil)
            @effectProfiles = ZiggeoEffectProfiles.new(self)
        end
        return @effectProfiles    end

    def effectProfileProcess()
        if (@effectProfileProcess == nil)
            @effectProfileProcess = ZiggeoEffectProfileProcess.new(self)
        end
        return @effectProfileProcess    end

    def metaProfiles()
        if (@metaProfiles == nil)
            @metaProfiles = ZiggeoMetaProfiles.new(self)
        end
        return @metaProfiles    end

    def metaProfileProcess()
        if (@metaProfileProcess == nil)
            @metaProfileProcess = ZiggeoMetaProfileProcess.new(self)
        end
        return @metaProfileProcess    end

    def webhooks()
        if (@webhooks == nil)
            @webhooks = ZiggeoWebhooks.new(self)
        end
        return @webhooks    end

    def analytics()
        if (@analytics == nil)
            @analytics = ZiggeoAnalytics.new(self)
        end
        return @analytics    end


end