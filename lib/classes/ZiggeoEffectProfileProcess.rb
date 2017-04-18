class ZiggeoEffectProfileProcess

  def initialize(application)
    @application = application
  end

  def index(effect_token_or_key, data = nil)
    return @application.connect.getJSON('/effects/' + effect_token_or_key + '/process', data)
  end

  def get(effect_token_or_key, token_or_key)
    return @application.connect.getJSON('/effects/' + effect_token_or_key + '/process/' + token_or_key + '')
  end

  def delete(effect_token_or_key, token_or_key)
    return @application.connect.delete('/effects/' + effect_token_or_key + '/process/' + token_or_key + '')
  end

  def create_filter_process(effect_token_or_key, data = nil)
    return @application.connect.postJSON('/effects/' + effect_token_or_key + '/process/filter', data)
  end

  def create_watermark_process(effect_token_or_key, data = nil, file = nil)
    return @application.connect.postJSON('/effects/' + effect_token_or_key + '/process/watermark', data, file)
  end

end
