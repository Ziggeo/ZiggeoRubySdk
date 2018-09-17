class ZiggeoMetaProfiles

  def initialize(application)
    @application = application
  end

  def create(data = nil)
    return @application.connect.postJSON('/v1/metaprofiles/', data)
  end

  def index(data = nil)
    return @application.connect.getJSON('/v1/metaprofiles/', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/v1/metaprofiles/' + token_or_key + '')
  end

  def delete(token_or_key)
    return @application.connect.delete('/v1/metaprofiles/' + token_or_key + '')
  end

end
