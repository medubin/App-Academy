module ApplicationHelper
  def login_out_buttons
    @user = current_user

    buttons = <<-HTML
    #{@user ? @user.email : nil}
    #{button_to "login", new_session_url,  method: 'get' unless @user}
    #{button_to "create user", new_user_url,  method: 'get' unless @user}
    #{button_to "logout", session_url,  method: 'delete' if @user}
    HTML
    buttons.html_safe
  end


end
