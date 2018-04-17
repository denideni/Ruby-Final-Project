class UsersController < ApplicationController
 before_action :set_user, except: [:index, :new, :create, :friend_requests]
  before_action :authenticate_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
    @payment = Payment.new
  end

  def new
    @user = User.new
  end

  def edit
    redirect_to root_path unless @user == current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user == current_user && @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy if @user == current_user
    session[:user_id] = nil
    redirect_to root_path # user_path
  end

  def friend_requests
  end

  def send_friend_request
    current_user.send_friend_request(@user)
    redirect_back(fallback_location: @user)
  end

  def accept_friend_request
    current_user.accept_friend_request(@user)
    redirect_back(fallback_location: current_user)
  end

  def delete_friend
    current_user.delete_friend(@user)
    redirect_back(fallback_location: current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
