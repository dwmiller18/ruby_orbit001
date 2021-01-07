class SessionsController < ApplicationController
  def new
  end

  def create
    # find the user in our database by session and email
    user = User.find_by(email: params[:session][:email].downcase)
    # if the user matches and is authenticated with session and password
    if user && user.authenticate(params[:session][:password])
      # Login the user
      log_in user
      redirect_back_or user
    else
      # Create error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
