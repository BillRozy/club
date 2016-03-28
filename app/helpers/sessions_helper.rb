module SessionsHelper
	  def user_signed?

    !current_user.nil?
  end 

  
  def current_user
  	remember_token = User.encrypt(cookies[:remember_token])
   @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def current_user=(user)
  	@current_user = user
  end
end
