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
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @posts = Post.all
    if @post.save
      flash[:notice] = "Your post has been created"
      redirect_to "/"
    else render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:commentable_id => @post.id, :commentable_type => Post)
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Your post has been destroyed."
    redirect_to posts_path
  end


private
  def post_params
    params.require(:post).permit(:link, :description)
  end

end