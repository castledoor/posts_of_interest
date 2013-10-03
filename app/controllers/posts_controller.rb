class PostsController < ApplicationController

  def index
    @post = Post.new
    @posts = Post.all
    @vote = Vote.new
    @sort = Post.sort
  end

  def new 
    @post = Post.create(post_params)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @posts = Post.all
    if @post.save
      flash[:notice] = "Your post has been created"
      redirect_to "/"
    else render :new
    end
  end

  def show
    @post = Post.find(post_params[:id])
  end

private
  def post_params
    params.require(:post).permit(:link, :description)
  end

end