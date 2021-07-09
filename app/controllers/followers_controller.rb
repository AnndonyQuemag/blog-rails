class FollowersController < ApplicationController
  def index
    @follows = Follow.all
    @articles = Article.all if current_user
    @followes = current_user.followings if current_user
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      redirect_follow
    else
      render :new
    end
  end

  def destroy
    @follow = Follow.find(params[:id])

    @follow.destroy

    redirect_follow
  end

  private

  def follow_params
    follow = params.permit(:follower_id, :followed_user_id)
    #params.require(:follow).permit(:follower_id, :followed_user_id)
  end

  def redirect_follow
    redirect_back(fallback_location: root_path)
  end
end
