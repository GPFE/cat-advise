class LikeHistoriesController < ApplicationController
  def show
    if current_user.likes
      @likes = current_user.likes.where(is_liked: true)
      @dislikes = current_user.likes.where(is_liked: false)
    else
      @likes = []
      @dislikes = []
    end
  end
end
