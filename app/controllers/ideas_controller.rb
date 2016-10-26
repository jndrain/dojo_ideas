class IdeasController < ApplicationController
  def index
    @user = User.where(id: session[:user_id]).first
    @posts = Post.all
    @likes =  Like.where(user_id: session[:user_id])
  end
  def create
    @post = Post.create(user_id: session[:user_id], content: params[:content])
      redirect_to "/bright_ideas"
  end
  def show
    @post = Post.where(id: params[:id]).first
    @like = Like.where(post_id: @post.id)
  end
  def like
    Like.create(user_id: session[:user_id], post_id: params[:post_id])
    redirect_to "/bright_ideas"
  end
  def destroy
    post = Post.where(id: params[:id]).first
    post.destroy
    redirect_to "/bright_ideas"
  end
end
