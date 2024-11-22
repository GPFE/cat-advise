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
    @user = User.find(current_user.id)
    @post = @user.posts.build
    @post = @user.posts.new(get_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    puts params.inspect
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(get_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
  end

  private

  def get_params
    params.require(:post).permit(:name, :content)
  end
end
