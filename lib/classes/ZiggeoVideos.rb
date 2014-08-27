class ZiggeoVideos

  def initialize(application)
    @application = application
  end

  def index(data = nil)
    return @application.connect.getJSON('/videos/', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/videos/' + token_or_key + '')
  end

  def update(token_or_key, data = nil)
    return @application.connect.postJSON('/videos/' + token_or_key + '', data)
  end

  def delete(token_or_key)
    return @application.connect.delete('/videos/' + token_or_key + '')
  end

  def create(data = nil, file = nil)
    return @application.connect.postJSON('/videos/', data, file)
  end

end
