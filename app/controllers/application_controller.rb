class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def log_in(user)
  	remember_token = User.new_remember_token
  	cookies.permanent[:remember_token] = remember_token
  	user.update_attribute(:remember_token, User.encrypt(remember_token))
  	self.current_user = user
  end	

  def sign_out(user)
  	 current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end	


  def current_user
  	remember_token = User.encrypt(cookies[:remember_token])
   @current_user ||= User.find_by(remember_token: remember_token)
  end
  
  def current_user=(user)
  	@current_user = user
  end

  def user_signed?

    !current_user.nil?
  end 

   include SessionsHelper
   include PostsHelper

end
