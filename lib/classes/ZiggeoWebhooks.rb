class ZiggeoWebhooks

  def initialize(application)
    @application = application
  end

  def create(data = nil)
    return @application.connect.post('/api/hook', data)
  end

  def delete(data = nil)
    return @application.connect.post('/api/removehook', data)
  end

end
