class PostsController < ApplicationController
  def new
  	@post = Post.new
    @categories = Category.all
  end
  
  def create
  	post_params = params.require(:post).permit(:category_id,:title,:body)
  	@post = Post.new(post_params)
  	 if @post.save
  	 	redirect_to @post, notice: 'Post was successfuly created.'
  	 else
  	 	render :new
  	 end  	
  end
  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def index
  	@post = Post.all
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post_params = params.require(:post).permit(:category_id,:title,:body)
  	@post = Post.new(post_params)
  	 if @post.update
  	 	redirect_to @post, notice: 'Post was successfuly updated.'
  	 else
  	 	render :edit
  	 end  	
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_url, notice: 'Post was successfuly destroied.'
  end
end
