require 'time'

class BasicController
  def initialize(headers)
    @request_headers = headers
  end

  def render(path)
    @response_body = IO.read(path)
    "#{response_headers('200 OK')}\n#{@response_body}"
  end

  private

  def response_headers(status)
    "HTTP/1.1 #{status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Cache-Control: no-cache\n"\
    "Date: #{Time.now.rfc822}\n"\
    "Server: TestServer\n"\
    "Content-Length: #{@response_body.bytesize}\n"
  end
end
