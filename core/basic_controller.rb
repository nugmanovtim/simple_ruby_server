require 'time'

class BasicController
  def initialize(request)
    @request = request
  end

  def render(path, status: 200)
    @body = IO.read(path)
    @status = status
    http_response
  end

  def redirect_to(path, status: 302)
    @redirect_path = path
    @status = status
    http_response
  end

  def no_routes_matched
    render('./views/no_routes_matched.html', status: 404)
  end

  private

  def http_response
    if @status == 302
      redirect_headers
    else
      response_headers << @body
    end
  end

  def response_headers
    "HTTP/1.1 #{@status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Cache-Control: no-cache\n"\
    "Date: #{Time.now.rfc822}\n"\
    "Server: TestServer\n"\
    "Content-Length: #{@body.bytesize}\n"\
    "\n"
  end

  def redirect_headers
    "HTTP/1.1 #{@status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Location: #{@redirect_path}\n"\
    "Content-Length: 0\n"
  end
end
