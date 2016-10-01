class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      log_in user
      redirect_to root_path
    elsif
      user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
