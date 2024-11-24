class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(get_params)
    @comment.owner_id = current_user.id

    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(get_params)
      redirect_to post_path(params[:id])
    end
  end

  def show
  end

  private

  def get_params
    params.require(:comment).permit(:content)
  end
end
