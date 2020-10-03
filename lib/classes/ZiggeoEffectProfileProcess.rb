class ZiggeoEffectProfileProcess

  def initialize(application)
    @application = application
  end

  def index(effect_token_or_key, data = nil)
    return @application.connect.getJSON('/v1/effects/' + effect_token_or_key + '/process', data)
  end

  def get(effect_token_or_key, token_or_key)
    return @application.connect.getJSON('/v1/effects/' + effect_token_or_key + '/process/' + token_or_key + '')
  end

  def delete(effect_token_or_key, token_or_key)
    return @application.connect.delete('/v1/effects/' + effect_token_or_key + '/process/' + token_or_key + '')
  end

  def create_filter_process(effect_token_or_key, data = nil)
    return @application.connect.postJSON('/v1/effects/' + effect_token_or_key + '/process/filter', data)
  end

  def create_watermark_process(effect_token_or_key, data = nil, file = nil)
    unless file.nil?
      result = @application.connect.postUploadJSON('/v1/effects/' + effect_token_or_key + '/process/watermark-upload-url', 'effect_process', data, file)
      result = @application.connect.postJSON('/v1/effects/' + effect_token_or_key + '/process/' + result["token"] + '/confirm-watermark');
      return result
    else
      return @application.connect.postJSON('/v1/effects/' + effect_token_or_key + '/process/watermark', data, file)
    end
  end

  def edit_watermark_process(effect_token_or_key, token_or_key, data = nil, file = nil)
    unless file.nil?
      result = @application.connect.postUploadJSON('/v1/effects/' + effect_token_or_key + '/process/' + token_or_key + '/watermark-upload-url', 'effect_process', data, file)
      result = @application.connect.postJSON('/v1/effects/' + effect_token_or_key + '/process/' + token_or_key + '/confirm-watermark');
      return result
    else
      return @application.connect.postJSON('/v1/effects/' + effect_token_or_key + '/process/watermark/' + token_or_key + '', data, file)
    end
  end

end
