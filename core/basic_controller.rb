require 'time'

class BasicController
  def initialize(request)
    @request = request
  end

  def render(path, status: '200 OK')
    @response_body = IO.read(path)
    "#{response_headers(status)}\n#{@response_body}"
  end

  def redirect_to(path, status: '302 Found')
    redirected_headers(path, status)
  end

  def no_routes_matched
    render('./views/no_routes_matched.html', status: 404)
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

  def redirected_headers(path, status)
    "HTTP/1.1 #{status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Location: #{path}\n"\
    "Content-Length: 0\n"
  end
end
