class ZiggeoEffectProfiles

  def initialize(application)
    @application = application
  end

  def create(data = nil)
    return @application.connect.postJSON('/effects/', data)
  end

  def index(data = nil)
    return @application.connect.getJSON('/effects/', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/effects/' + token_or_key + '')
  end

  def delete(token_or_key)
    return @application.connect.delete('/effects/' + token_or_key + '')
  end

end
