class ZiggeoAnalytics

  def initialize(application)
    @application = application
  end

  def get(data = nil)
    return @application.connect.postJSON('/v1/analytics/get', data)
  end

end
