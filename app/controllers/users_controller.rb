class UsersController < ApplicationController
  def show
  	@user = User.where(id: params[:id]).first
  	@posts = Post.where(user_id: session[:user_id])
  	@likes = Like.where(user_id: session[:user_id])
  end
end
