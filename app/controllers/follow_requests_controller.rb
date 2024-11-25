class FollowRequestsController < ApplicationController
  def new
  end

  def index
    @follow_requests = current_user.follow_requests
    @foreign_follow_requests = current_user.follow_requests.where("requester_id != ?", current_user.id)

    if params[:foreign_requests]
      @requests = @foreign_follow_requests

    @foreign_follow_requests_btn_c = "bg-primary text-white"
      @follow_requests_btn_c = ""
    else
      @requests = @follow_requests

      @follow_requests_btn_c = "bg-primary text-white"
      @foreign_follow_requests_btn_c = ""
    end
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
