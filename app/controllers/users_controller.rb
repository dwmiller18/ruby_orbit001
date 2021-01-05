class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      # Handle a successful save
      flash[:success] = "Welcome to Orbit"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    # Returns a version of the params hash with only the permitted attributes.
    # This avoids someone accessing a part of the site we don't want them to.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
