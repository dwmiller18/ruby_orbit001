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
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    # This puts the session url into the forwarding_url key only for get request
    session[:forwarding_url] = request.original_url if request.get?
  end

  def current_user?(user)
    user && user == current_user
  end
end
