require './core/basic_controller'
class Controller < BasicController
  def index
    render 'index'
  end

  def login
    if correct_credentials?
      set_cookies(session: 'session')
      redirect_to '/secret'
    else
      redirect_to '/'
    end
  end

  def secret
    return redirect_to '/' unless authorized?
    render 'secret'
  end

  private

  def correct_credentials?
    correct_username = 'admin'
    correct_password = 'admin'
    input_username = @request.params['username']
    input_password = @request.params['password']
    correct_username == input_username && correct_password == input_password
  end

  def authorized?
    cookies['session'] == 'session'
  end
end
