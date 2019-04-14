class ZiggeoWebhooks

  def initialize(application)
    @application = application
  end

  def create(data = nil)
    return @application.connect.post('/v1/api/hook', data)
  end

  def confirm(data = nil)
    return @application.connect.post('/v1/api/confirmhook', data)
  end

  def delete(data = nil)
    return @application.connect.post('/v1/api/removehook', data)
  end

end
