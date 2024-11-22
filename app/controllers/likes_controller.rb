class LikesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(get_params)
    @like.user_id = current_user.id

    if @like.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def get_params
    params.require(:like).permit(:is_liked)
  end
end
