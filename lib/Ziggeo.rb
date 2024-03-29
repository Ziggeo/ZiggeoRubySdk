require 'net/http'
require 'json'
require 'uri'
require 'cgi'

require_relative "classes/ZiggeoConfig"
require_relative "classes/ZiggeoConnect"
require_relative "classes/ZiggeoAuth"
require_relative "classes/ZiggeoVideos"
require_relative "classes/ZiggeoStreams"
require_relative "classes/ZiggeoAudios"
require_relative "classes/ZiggeoAudioStreams"
require_relative "classes/ZiggeoAuthtokens"
require_relative "classes/ZiggeoApplication"
require_relative "classes/ZiggeoEffectProfiles"
require_relative "classes/ZiggeoEffectProfileProcess"
require_relative "classes/ZiggeoMetaProfiles"
require_relative "classes/ZiggeoMetaProfileProcess"
require_relative "classes/ZiggeoWebhooks"
require_relative "classes/ZiggeoAnalytics"

class Ziggeo

    attr_accessor :token, :private_key, :encryption_key, :config, :connect, :api_connect, :cdn_connect, :js_cdn_connect

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
        cdn_url = @config.cdn_url
        cdn_regions = @config.cdn_regions
        cdn_regions.each do |key, value|
            if (@token.start_with?(key))
                cdn_url = value
            end
        end
        @cdn_connect = ZiggeoConnect.new(self, cdn_url)
				js_cdn_url = @config.js_cdn_url
				js_cdn_regions = @config.js_cdn_regions
				js_cdn_regions.each do |key, value|
						if (@token.start_with?(key))
								js_cdn_url = value
						end
				end
				@js_cdn_connect = ZiggeoConnect.new(self, js_cdn_url)
        @auth = nil
        @videos = nil
        @streams = nil
        @audios = nil
        @audioStreams = nil
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
        @auth = @auth || ZiggeoAuth.new(self)
        return @auth
    end

    def videos()
        @videos = @videos || ZiggeoVideos.new(self)
        return @videos
    end

    def streams()
        @streams = @streams || ZiggeoStreams.new(self)
        return @streams
    end

    def audios()
        @audios = @audios || ZiggeoAudios.new(self)
        return @audios
    end

    def audioStreams()
        @audioStreams = @audioStreams || ZiggeoAudioStreams.new(self)
        return @audioStreams
    end

    def authtokens()
        @authtokens = @authtokens || ZiggeoAuthtokens.new(self)
        return @authtokens
    end

    def application()
        @application = @application || ZiggeoApplication.new(self)
        return @application
    end

    def effectProfiles()
        @effectProfiles = @effectProfiles || ZiggeoEffectProfiles.new(self)
        return @effectProfiles
    end

    def effectProfileProcess()
        @effectProfileProcess = @effectProfileProcess || ZiggeoEffectProfileProcess.new(self)
        return @effectProfileProcess
    end

    def metaProfiles()
        @metaProfiles = @metaProfiles || ZiggeoMetaProfiles.new(self)
        return @metaProfiles
    end

    def metaProfileProcess()
        @metaProfileProcess = @metaProfileProcess || ZiggeoMetaProfileProcess.new(self)
        return @metaProfileProcess
    end

    def webhooks()
        @webhooks = @webhooks || ZiggeoWebhooks.new(self)
        return @webhooks
    end

    def analytics()
        @analytics = @analytics || ZiggeoAnalytics.new(self)
        return @analytics
    end

end