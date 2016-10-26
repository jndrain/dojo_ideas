class SessionsController < ApplicationController
  def index
    render "index"
  end
  def register
  	@user = User.create(name: params[:name], alias: params[:alias], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = "Invalid"
      redirect_to "/"
    end
  end
  def login
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session[:user_id]
      redirect_to "/bright_ideas"
    else
      flash[:errors] = "Invalid"
      redirect_to "/"
    end
  end
  def logout
  	reset_session
	redirect_to "/"
  end
end