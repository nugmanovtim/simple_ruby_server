require './controller.rb'
require './routes.rb'
class Dispatcher
  def initialize(request)
    @request = request
  end

  def perform
    ensure_request_is_correct
    invoke_controller(grab_action_name)
  rescue NoRoutesMatched
    invoke_controller(:no_routes_matched)
  end

  private

  class NoRoutesMatched < RuntimeError; end

  def ensure_request_is_correct
    ensure_http_method_is_correct
    ensure_url_is_correct
  end

  def ensure_http_method_is_correct
    raise NoRoutesMatched if ROUTES[@request.http_method].nil?
  end

  def ensure_url_is_correct
    raise NoRoutesMatched if grab_action_name.nil?
  end

  def invoke_controller(action)
    @response = Controller.new(@request).method(action).call
  end

  def grab_action_name
    ROUTES[@request.http_method][@request.request_url]
  end
end
