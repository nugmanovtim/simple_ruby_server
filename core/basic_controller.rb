require 'time'
require './core/simple_cache.rb'
require './core/dispatcher.rb'

class BasicController
  def initialize(request)
    @request = request
    @set_cookies = {}
  end

  def render(name, status: 200)
    response_with_body(status,
                       SimpleCache.retrieve(name) { IO.read(view_path(name)) })
  end

  def redirect_to(url, status: 302)
    response = redirect_headers(status, url)
    response << "\n" << render(action_by_url(url)) if @request.keep_alive?
    response
  end

  def no_routes_matched
    render('no_routes_matched', status: 404)
  end

  private

  def response_with_body(status, body)
    response_headers(status, body) << body
  end

  def response_headers(status, body)
    "HTTP/1.1 #{status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Cache-Control: private\n"\
    "Connection: keep-alive\n"\
    "Date: #{Time.now.rfc822}\n"\
    "Server: TestServer\n" +
      set_cookie_headers +
      "Content-Length: #{body.bytesize}\n"\
      "\n"
  end

  def redirect_headers(status, redirect_path)
    "HTTP/1.1 #{status}\n"\
    "Content-Type: text/html; charset=utf-8\n"\
    "Location: #{redirect_path}\n" +
      set_cookie_headers +
      "Content-Length: 0\n"
  end

  # Assume only GET method is used
  def action_by_url(url)
    Dispatcher.grab_action_name('GET', url)
  end

  def view_path(name)
    "./views/#{name}.html"
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
