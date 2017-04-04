class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user 
  before_action :require_login

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  private
  def require_login  
    unless current_user
      redirect_to login_path
    end
  end

end
