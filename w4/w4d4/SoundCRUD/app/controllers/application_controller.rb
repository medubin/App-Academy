class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout_user!
    current_user.reset_session_token! unless current_user.nil?
    session[:session_token] = nil
    @current_user = nil
  end

  def logged_in?
    current_user.nil && current_user.session_token == session[:session_token]
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end