class FriendsController < ApplicationController
  def create
    new_friend = current_user.friends.build(friend_id: params[:friend_id])
    if new_friend.save
      redirect_to root_path, notice: 'Friend added successfully'
    else
      redirect_to root_path, alert: 'Friend not added'
    end
  end
end
