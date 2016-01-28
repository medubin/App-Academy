class UsersController < ApplicationController
  before_action :require_logout, only: :new
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    #fail
    #@user.password = @user.password
    login_user!
    #fail
    if @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      session[:session_token] = nil
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
