class ZiggeoEffectProfiles

  def initialize(application)
    @application = application
  end

  def create(data = nil)
    return @application.connect.postJSON('/v1/effects/', data)
  end

  def index(data = nil)
    return @application.connect.getJSON('/v1/effects/', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/v1/effects/' + token_or_key + '')
  end

  def delete(token_or_key)
    return @application.connect.delete('/v1/effects/' + token_or_key + '')
  end

  def update(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/effects/' + token_or_key + '', data)
  end

end
