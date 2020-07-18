class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/' unless logged_in?
  end

  def display_page_not_found
    render file: "#{Rails.root}/public/404.html", layout: false, status:404
  end
end
