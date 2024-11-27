class PostsController < ApplicationController
  def index
    @likes = current_user.likes.pluck(:post_id)

    if params[:recent]
      @posts = []

      Post.all.each do |post|
        if current_user.followers.pluck(:id).include?(post.owner_id)
          @posts << post
        end
      end

      @recent_button = "btn btn-primary text-white"
      @all_button = ""
    else
      @posts = Post.all
      @recent_button = ""
      @all_button = "btn btn-primary text-white"
    end
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
      flash[:success] = "Message saved."
    else
      flash.now[:failure] = "Cannot be saved!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    puts params.inspect
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    unless @post.update(get_params)
      flash[:error] = "Cannot update!"
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
