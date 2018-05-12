class ZiggeoVideos

  def initialize(application)
    @application = application
  end

  def index(data = nil)
    return @application.connect.getJSON('/videos/', data)
  end

  def count(data = nil)
    return @application.connect.getJSON('/videos/count', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/videos/' + token_or_key + '')
  end

  def get_bulk(data = nil)
    return @application.connect.postJSON('/videos/get_bulk', data)
  end

  def download_video(token_or_key)
    return @application.connect.get('/videos/' + token_or_key + '/video')
  end

  def download_image(token_or_key)
    return @application.connect.get('/videos/' + token_or_key + '/image')
  end

  def push_to_service(token_or_key, data = nil)
    return @application.connect.postJSON('/videos/' + token_or_key + '/push', data)
  end

  def apply_effect(token_or_key, data = nil)
    return @application.connect.postJSON('/videos/' + token_or_key + '/effect', data)
  end

  def update(token_or_key, data = nil)
    return @application.connect.postJSON('/videos/' + token_or_key + '', data)
  end

  def update_bulk(data = nil)
    return @application.connect.postJSON('/videos/update_bulk', data)
  end

  def delete(token_or_key)
    return @application.connect.delete('/videos/' + token_or_key + '')
  end

  def create(data = nil, file = nil)
    return @application.connect.postJSON('/videos/', data, file)
  end

  def analytics(token_or_key, data = nil)
    return @application.connect.postJSON('/videos/' + token_or_key + '/analytics', data)
  end

end
