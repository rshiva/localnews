class CommentsController < ApplicationController
  before_filter :authenticate_user! ,:except => [:show]
  
  def new
    @post=Post.find(params[:post_id])
  end
  
  def create
    @post=Post.find(params[:post_id])
    @comment=@post.comments.build(params[:comment])
    @comment.user_id=current_user.id
    @comment.save!
    redirect_to @post
  end 
  
  
  def show
     @post=Post.find(params[:post_id])
    @comment= @post.comments.all
  end
  
end
