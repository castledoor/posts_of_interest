class CommentsController < ApplicationController

  def index
    @comment = Comment.new(:post_id => params[:post_id])
    @comments = Comment.where(:post_id => params[:post_id])
    @post_id = params[:post_id]
    @post_description = params[:description]
  end
  
  def create 
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post_id = params[:comment][:post_id]
    if @comment.save
      flash[:notice] = "thank you for contributing"
      redirect_to post_path(params[:id])
    else render :new
    end
  end

  def new 
    @comment = Comment.new(:commentable_id => params[:commentable_id], :commentable_type => params[:commentable_type])
  end

private
  def comment_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end



end