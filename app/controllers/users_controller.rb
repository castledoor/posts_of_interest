class UsersController < ApplicationController

  def new 
    @user = User.new(:username => params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: "Thank you for signing up"
    else 
      render "new"
    end
  end

  def show
      @posts = current_user.posts
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end