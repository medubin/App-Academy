class SessionsController < ApplicationController
  def create
    @user = User.find_by_credential(session_params[:email], session_params[:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      @user = User.new(session_params)
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

  def new
    @user = User.new
    render :new
  end

  private
  def session_params
    params.require(:user).permit(:email, :password, :session_token)
  end


end
