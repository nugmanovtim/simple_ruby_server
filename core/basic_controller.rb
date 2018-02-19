class BasicController
  def initialize(headers)
    @headers = headers
  end

  def render(path)
    IO.read(path)
  end
end
