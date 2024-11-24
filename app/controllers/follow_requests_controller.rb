class FollowRequestsController < ApplicationController
  def new
  end

  def index
    @follow_requests = current_user.follow_requests
  end

  def create
    @follow_request = current_user.follow_requests.build(get_params)

    unless @follow_request.save
      flash[:error] = "Cannot follow!"
    end
  end

  private

  def get_params
    params.require(:follow_request).permit(:receiver_id)
  end
end
