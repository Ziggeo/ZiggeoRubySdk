class ZiggeoAudios

  def initialize(application)
    @application = application
  end

  def index(data = nil)
    return @application.api_connect.getJSON('/server/v1/audios/', data)
  end

  def count(data = nil)
    return @application.api_connect.getJSON('/server/v1/audios/count', data)
  end

  def get(token_or_key)
    return @application.api_connect.getJSON('/server/v1/audios/bytoken/' + token_or_key + '')
  end

  def get_bulk(data = nil)
    return @application.api_connect.postJSON('/server/v1/audios/get-bulk', data)
  end

  def download_audio(token_or_key)
    return @application.connect.get('/v1/server/v1/audios/bytoken/' + token_or_key + '/video')
  end

  def update(token_or_key, data = nil)
    return @application.api_connect.postJSON('/server/v1/audios/bytoken/' + token_or_key + '', data)
  end

  def update_bulk(data = nil)
    return @application.api_connect.postJSON('/server/v1/audios/update-bulk', data)
  end

  def delete(token_or_key)
    return @application.api_connect.delete('/server/v1/audios/bytoken/' + token_or_key + '')
  end

  def create(data = nil, file = nil)
    unless file.nil?
      result = @application.connect.postUploadJSON('/server/v1/audios/audios-upload-url', 'audio', data, file, 'audio_type')
      result["default_stream"] = @application.connect.postJSON('/server/v1/audios/' + result["token"] + '/streams/' + result["default_stream"]["token"] + '/confirm-audio');
      return result
    else
      return @application.api_connect.postJSON('/server/v1/audios/', data, file)
    end
  end

end
