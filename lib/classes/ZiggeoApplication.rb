class ZiggeoApplication

  def initialize(application)
    @application = application
  end

  def get()
    return @application.connect.getJSON('/v1/application')
  end

  def update(data = nil)
    return @application.connect.postJSON('/v1/application', data)
  end

  def get_stats(data = nil)
    return @application.api_connect.getJSON('/server/v1/application/stats', data)
  end

end
