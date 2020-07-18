class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  # Log in / Create new session
  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def welcome
    @url = Url.new

    if logged_in?
      # Gives the user's shortened URLs
      @urls = Url.where(user_id: session[:user_id])
    end
  end

  # Log out
  def destroy
    if logged_in?
      session[:user_id] = nil
      redirect_to '/welcome'
    end
  end
end
