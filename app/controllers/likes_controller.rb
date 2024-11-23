class LikesController < ApplicationController
  def create
    @post = Post.find(get_params[:post_id].to_i)
    @like = @post.likes.new(get_params)
    @like.user_id = current_user.id

    if @like.save
      flash[:success] = "Saved"
      redirect_to root_path
    else
      update
    end
  end

  def update
    @post = Post.find(get_params[:post_id])
    @like = @post.likes.find_by(user_id: current_user.id)

    if @like.update(get_params)
      flash[:success] = "Saved"
      redirect_to root_path
    end
  end

  def destroy
    # Like.find(params[:id]).delete
  end

  private

  def get_params
    params.require(:like).permit(:is_liked, :post_id)
  end
end
