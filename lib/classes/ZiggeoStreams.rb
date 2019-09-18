class ZiggeoStreams

  def initialize(application)
    @application = application
  end

  def index(video_token_or_key, data = nil)
    return @application.connect.getJSON('/v1/videos/' + video_token_or_key + '/streams', data)
  end

  def get(video_token_or_key, token_or_key)
    return @application.connect.getJSON('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '')
  end

  def download_video(video_token_or_key, token_or_key)
    return @application.connect.get('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/video')
  end

  def download_image(video_token_or_key, token_or_key)
    return @application.connect.get('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/image')
  end

  def push_to_service(video_token_or_key, token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/push', data)
  end

  def delete(video_token_or_key, token_or_key)
    return @application.connect.delete('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '')
  end

  def create(video_token_or_key, data = nil, file = nil)
    return @application.connect.postJSON('/v1/videos/' + video_token_or_key + '/streams', data, file)
  end

  def attach_image(video_token_or_key, token_or_key, data = nil, file = nil)
    return @application.connect.postJSON('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/image', data, file)
  end

  def attach_video(video_token_or_key, token_or_key, data = nil, file = nil)
    return @application.connect.postJSON('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/video', data, file)
  end

  def attach_subtitle(video_token_or_key, token_or_key, data = nil)
    return @application.connect.postJSON('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/subtitle', data)
  end

  def bind(video_token_or_key, token_or_key)
    return @application.connect.postJSON('/v1/videos/' + video_token_or_key + '/streams/' + token_or_key + '/bind')
  end

end
