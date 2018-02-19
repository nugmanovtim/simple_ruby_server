require './controller.rb'
module Dispatcher
  ROUTES = {
    'POST' => {
      '/login' => :login
    },
    'GET' => {
      '/' => :index,
      '/secret' => :secret
    }
  }.freeze

  def self.dispatch(request)
    Controller.new(request.headers)
              .method(ROUTES[request.http_method][request.request_url]).call
  end
end
