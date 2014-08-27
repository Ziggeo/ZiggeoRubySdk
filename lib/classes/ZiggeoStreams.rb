class ZiggeoStreams

  def initialize(application)
    @application = application
  end

  def index(video_token_or_key, data = nil)
    return @application.connect.getJSON('/videos/' + video_token_or_key + '/streams', data)
  end

  def get(video_token_or_key, token_or_key)
    return @application.connect.getJSON('/videos/' + video_token_or_key + '/streams/' + token_or_key + '')
  end

  def download_video(video_token_or_key, token_or_key)
    return @application.connect.get('/videos/' + video_token_or_key + '/streams/' + token_or_key + '/video')
  end

  def download_image(video_token_or_key, token_or_key)
    return @application.connect.get('/videos/' + video_token_or_key + '/streams/' + token_or_key + '/image')
  end

  def delete(video_token_or_key, token_or_key)
    return @application.connect.delete('/videos/' + video_token_or_key + '/streams/' + token_or_key + '')
  end

  def create(video_token_or_key, data = nil, file = nil)
    return @application.connect.postJSON('/videos/' + video_token_or_key + '/streams', data, file)
  end

end
