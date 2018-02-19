require './core/basic_controller'
class Controller < BasicController
  def index
    render './views/index.html'
  end

  def login
    throw NotImplementedError
  end

  def secret
    throw NotImplementedError
  end
end
