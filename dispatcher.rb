require './controller.rb'
class Dispatcher
  ROUTES = {
    'POST' => {
      '/login' => :login
    },
    'GET' => {
      '/' => :index,
      '/secret' => :secret
    }
  }.freeze

  class NoRoutesMatched < RuntimeError; end

  def initialize(request)
    @request = request
  end

  def perform
    ensure_correct_request
    invoke_controller(grab_action_name)
  rescue NoRoutesMatched
    invoke_controller(:no_routes_matched)
  end

  private

  def ensure_correct_request
    ensure_correct_http_method
    ensure_correct_url
  end

  def ensure_correct_http_method
    raise NoRoutesMatched if ROUTES[@request.http_method].nil?
  end

  def ensure_correct_url
    raise NoRoutesMatched if grab_action_name.nil?
  end

  def invoke_controller(action)
    Controller.new(@request).method(action).call
  end

  def grab_action_name
    ROUTES[@request.http_method][@request.request_url]
  end
end
