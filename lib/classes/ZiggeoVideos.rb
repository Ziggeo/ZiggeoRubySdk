class ZiggeoVideos

  def initialize(application)
    @application = application
  end

  def index(data = nil)
    return @application.connect.getJSON('/v1/videos/', data)
  end

  def count(data = nil)
    return @application.connect.getJSON('/v1/videos/count', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/v1/videos/' + token_or_key + '')
  end

  def get_bulk(data = nil)
    return @application.connect.postJSON('/v1/videos/get_bulk', data)
  end

  def stats_bulk(data = nil)
    return @application.connect.postJSON('/v1/videos/stats_bulk', data)
  end

  def download_video(token_or_key)
    return @application.connect.get('/v1/videos/' + token_or_key + '/video')
  end

  def download_image(token_or_key)
    return @application.connect.get('/v1/videos/' + token_or_key + '/image')
  end

  def get_stats(token_or_key)
    return @application.connect.getJSON('/v1/videos/' + token_or_key + '/stats')
  end

  def push_to_service(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + token_or_key + '/push', data)
  end

  def apply_effect(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + token_or_key + '/effect', data)
  end

  def apply_meta(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + token_or_key + '/metaprofile', data)
  end

  def update(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + token_or_key + '', data)
  end

  def update_bulk(data = nil)
    return @application.connect.postJSON('/v1/videos/update_bulk', data)
  end

  def delete(token_or_key)
    return @application.connect.delete('/v1/videos/' + token_or_key + '')
  end

  def create(data = nil, file = nil)
    unless file.nil?
      result = @application.connect.postUploadJSON('/v1/videos-upload-url', 'video', data, file, 'video_type')
      result["default_stream"] = @application.connect.postJSON('/v1/videos/' + result["token"] + '/streams/' + result["default_stream"]["token"] + '/confirm-video');
      return result
    else
      return @application.connect.postJSON('/v1/videos/', data, file)
    end
  end

  def analytics(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + token_or_key + '/analytics', data)
  end

end
