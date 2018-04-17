class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :authenticate_user

  def logged_in?
    session[:user_id]
  end

  def current_user
    begin
        @current_user ||= User.find(session[:user_id]) if logged_in?    
    rescue Exception => e
      
      reset_session
    end
  end

  def authenticate_user
    redirect_to root_path unless logged_in?
  end
end
