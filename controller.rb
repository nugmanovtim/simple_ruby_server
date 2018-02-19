class Controller
  def initialize(headers)
    @headers = headers
  end

  def index
    "Time is #{Time.now}"
  end

  def login
    throw NotImplementedError
  end

  def secret
    throw NotImplementedError
  end
end
