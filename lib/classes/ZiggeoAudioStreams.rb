class ZiggeoAudioStreams

  def initialize(application)
    @application = application
  end

  def index(audio_token_or_key, data = nil)
    return @application.api_connect.getJSON('/v1/audios/' + audio_token_or_key + '/streams', data)
  end

  def get(audio_token_or_key, token_or_key)
    return @application.api_connect.getJSON('/v1/audios/' + audio_token_or_key + '/streams/' + token_or_key + '')
  end

  def download_audio(audio_token_or_key, token_or_key)
    return @application.js_cdn_connect.get('/v1/audios/' + audio_token_or_key + '/streams/' + token_or_key + '/audio')
  end

  def delete(audio_token_or_key, token_or_key)
    return @application.api_connect.delete('/v1/audios/' + audio_token_or_key + '/streams/' + token_or_key + '')
  end

  def create(audio_token_or_key, data = nil, file = nil)
    unless file.nil?
      result = @application.connect.postUploadJSON('/v1/audios/' + audio_token_or_key + '/streams-upload-url', 'stream', data, file, 'audio_type')
      result = @application.connect.postJSON('/v1/audios/' + audio_token_or_key + '/streams/' + result["token"] + '/confirm-audio');
      return result
    else
      return @application.api_connect.postJSON('/v1/audios/' + audio_token_or_key + '/streams', data, file)
    end
  end

end
