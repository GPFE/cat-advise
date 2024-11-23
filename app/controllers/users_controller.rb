class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(owner_id: params[:id])
    @likes = current_user.likes.pluck(:post_id)
  end
end
