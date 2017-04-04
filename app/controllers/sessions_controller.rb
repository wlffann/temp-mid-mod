class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back!"
      redirect_to links_path
    else
      flash[:danger] = "Email and Password do not match"
      redirect_to '/login'
    end
  end
end
