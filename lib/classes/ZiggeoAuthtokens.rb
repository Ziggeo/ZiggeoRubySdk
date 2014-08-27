class ZiggeoAuthtokens

  def initialize(application)
    @application = application
  end

  def get(token)
    return @application.connect.getJSON('/authtokens/' + token + '')
  end

  def update(token_or_key, data = nil)
    return @application.connect.postJSON('/authtokens/' + token_or_key + '', data)
  end

  def delete(token_or_key)
    return @application.connect.delete('/authtokens/' + token_or_key + '')
  end

  def create(data = nil)
    return @application.connect.postJSON('/authtokens/', data)
  end

end
