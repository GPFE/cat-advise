class UsersController < ApplicationController
  def index
  end

  def show
    @posts = Post.where(owner_id: params[:id])
  end
end
