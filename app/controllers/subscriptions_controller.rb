class SubscriptionsController < ApplicationController
  def index
    @influencers = current_user.influencers

    if params[:subscriber]
      @follow_button = ""
      @subscriber_button = "bg-primary text-white"
    else
      @subscriber_button = ""
      @follow_button = "bg-primary text-white"
    end
  end

  def new
    @user = current_user
  end

  def create
    @follower = User.find(get_params[:follower_id])

    if UserFollower.create(influencer_id: current_user.id, follower_id: @follower.id)
      @follower.follow_requests.find(receiver_id: current_user.id).delete
      redirect_to root_path
      flash[:success] = "Accepted new follow request."
    else
      puts params.inspect
      flash[:failure] = "Error while trying to accept new follow request."
    end
  end

  private

  def get_params
    params.require(:user).permit(:follower_id)
  end
end