class FriendshipsController < ApplicationController
  def create
  end

  def destroy
    #render json: {parameter: params[:id]}
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    #render json: {friendship: friendship}
    
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
