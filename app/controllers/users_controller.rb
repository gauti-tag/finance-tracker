class UsersController < ApplicationController
  def my_porfolio
    @tracked_stocks = current_user.stocks
  end
  
  def my_friends
    @tracked_friends = current_user.friends
  end
  
  def search 
    render json: params[:friend]
  end
end
