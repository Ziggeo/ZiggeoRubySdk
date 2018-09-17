class ZiggeoAuthtokens

  def initialize(application)
    @application = application
  end

  def get(token)
    return @application.connect.getJSON('/v1/authtokens/' + token + '')
  end

  def update(token_or_key, data = nil)
    return @application.connect.postJSON('/v1/authtokens/' + token_or_key + '', data)
  end

  def delete(token_or_key)
    return @application.connect.delete('/v1/authtokens/' + token_or_key + '')
  end

  def create(data = nil)
    return @application.connect.postJSON('/v1/authtokens/', data)
  end

end
