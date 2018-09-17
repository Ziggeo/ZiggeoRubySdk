class ZiggeoMetaProfileProcess

  def initialize(application)
    @application = application
  end

  def index(meta_token_or_key)
    return @application.connect.getJSON('/v1/metaprofiles/' + meta_token_or_key + '/process')
  end

  def get(meta_token_or_key, token_or_key)
    return @application.connect.getJSON('/v1/metaprofiles/' + meta_token_or_key + '/process/' + token_or_key + '')
  end

  def delete(meta_token_or_key, token_or_key)
    return @application.connect.delete('/v1/metaprofiles/' + meta_token_or_key + '/process/' + token_or_key + '')
  end

  def create_video_analysis_process(meta_token_or_key)
    return @application.connect.postJSON('/v1/metaprofiles/' + meta_token_or_key + '/process/analysis')
  end

  def create_audio_transcription_process(meta_token_or_key)
    return @application.connect.postJSON('/v1/metaprofiles/' + meta_token_or_key + '/process/transcription')
  end

  def create_nsfw_process(meta_token_or_key, data = nil)
    return @application.connect.postJSON('/v1/metaprofiles/' + meta_token_or_key + '/process/nsfw', data)
  end

end
