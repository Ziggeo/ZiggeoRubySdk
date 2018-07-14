class ZiggeoMetaProfiles

  def initialize(application)
    @application = application
  end

  def create(data = nil)
    return @application.connect.postJSON('/metaprofiles/', data)
  end

  def index(data = nil)
    return @application.connect.getJSON('/metaprofiles/', data)
  end

  def get(token_or_key)
    return @application.connect.getJSON('/metaprofiles/' + token_or_key + '')
  end

  def delete(token_or_key)
    return @application.connect.delete('/metaprofiles/' + token_or_key + '')
  end

end
