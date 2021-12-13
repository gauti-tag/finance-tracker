class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    #render json: { friend: friend}
    
    current_user.friendships.build(friend_id: friend.id)
    
    if current_user.save
     flash[:notice] = "Follow friend"
    else
      flash[:alert] = "there was something wrong with the tracking request"
    end
    redirect_to my_friends_path
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
