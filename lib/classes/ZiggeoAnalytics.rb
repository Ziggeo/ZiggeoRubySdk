class ZiggeoAnalytics

  def initialize(application)
    @application = application
  end

  def get(data = nil)
    return @application.connect.postJSON('/analytics/get', data)
  end

end
