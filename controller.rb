require './core/basic_controller'
class Controller < BasicController
  def index
    render './views/index.html'
  end

  def login
    if correct_credentials?
      redirect_to '/secret'
    else
      redirect_to '/'
    end
  end

  def secret
    render './views/secret.html'
  end

  private

  def correct_credentials?
    correct_username = 'admin'
    correct_password = 'admin'
    input_username = @request.params['username']
    input_password = @request.params['password']
    correct_username == input_username && correct_password == input_password
  end
end
