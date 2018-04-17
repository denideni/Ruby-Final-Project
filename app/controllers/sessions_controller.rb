class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      redirect_to '/login'
    elsif @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to current_user
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
