class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  
  before_filter :login_required,:except => [:index,:show]
  
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
     @json = @post.location.to_gmaps4rails
     @location=@post.location
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @location=@post.build_location

  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @location=@post.location
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id=current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.user_id=current_user.id
    respond_to do |format|
      if @post.update_attributes(params[:post])
       format.html  {redirect_to @post ,  notice: 'Post was successfully Updated.'}
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end
end
