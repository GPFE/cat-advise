class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(current_user.id)
    @post = @user.posts.build
    puts params.inspect
  end

  def create
    puts params.inspect
    @user = User.find(current_user.id)
    @post = @user.posts.build
    @post = @user.posts.new(get_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def get_params
    params.require(:post).permit(:name, :content)
  end
end
