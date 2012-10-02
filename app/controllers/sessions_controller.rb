class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env["omniauth.auth"]
      omniauth = request.env["omniauth.auth"]
      authen = Authen.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])m
    
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def failure
    flash[:error] = "Invalid Credentials."
    redirect_to signup_url
  end
  
  
end
