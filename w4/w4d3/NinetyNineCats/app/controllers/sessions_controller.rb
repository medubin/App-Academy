class SessionsController < ApplicationController
  before_action :require_logout, only: :new
  def new
    @user = User.new
    render :new
  end


  def create
    @user = User.find_by_credentials(session_params[:user_name], session_params[:password])
    if @user
      login_user!
      redirect_to cats_url
    else
      flash.now[:errors] = ["Incorrect user_name/password combination"]
      @user = User.new
      render :new
    end
  end

  def destroy
    @user = current_user
    @user.reset_session_token! if @user
    session[:session_token] = nil
    redirect_to new_session_url
  end


  private
  def session_params
    params.require(:user).permit(:user_name, :password)
  end

end
