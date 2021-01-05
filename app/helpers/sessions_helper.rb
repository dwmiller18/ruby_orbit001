module SessionsHelper
  def log_in(user)
    # Cookies are automatically hashed for security
    # This code is to protect for shorter sessions using sessions and not using long-term logins with cookies
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      # If current user hasn't been assigned, it will find by user id
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete[:user_id]
    @current_user = nil
  end
end
