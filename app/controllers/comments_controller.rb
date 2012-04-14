class CommentsController < ApplicationController
  def new
    @post=Post.find(params[:post_id])
  end
  
  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.create!(params[:comment])
  end 
  
  
  def show
     @post=Post.find(params[:post_id])
    @comment= @post.comments.all
  end
  
end
