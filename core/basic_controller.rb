require 'time'
require './core/simple_cache.rb'

class BasicController
  def initialize(request)
    @request = request
    @set_cookies = {}
  end

  def render(path, status: 200)
    @body = SimpleCache.retrieve(path) { IO.read(path) }
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
    "Server: TestServer\n" +
      set_cookie_headers +
      "Content-Length: #{@body.bytesize}\n"\
      "\n"
  end

  def redirect_headers
    "HTTP/1.1 #{@status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Location: #{@redirect_path}\n" +
      set_cookie_headers +
      "Content-Length: 0\n"
  end

  def set_cookie_headers
    @set_cookies.map { |key, value| "Set-Cookie: #{key}=#{value}\n" }.join('')
  end

  def set_cookies(cookies)
    @set_cookies.merge!(cookies)
  end

  def cookies
    @request.headers['Cookie']&.split('; ')
            &.map { |pair| pair.split('=', 2) }&.to_h || {}
  end
end
