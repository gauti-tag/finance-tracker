class UsersController < ApplicationController
  def my_porfolio
    @tracked_stocks = current_user.stocks
  end
  
  def my_friends
    @tracked_friends = current_user.friends
  end
  
  def search 
    #render json: params[:friend]
    if params[:friend].present?
      
      @friend = params[:friend]
      
      if @friend
         respond_to do |format|
           format.js { render partial: 'users/friend_result' }
         end
       else
         respond_to do |format|
           flash.now[:alert] = "Can not find user"
           format.js {render partial: 'users/friend'}
         end
      end
      
    else 
      
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js {render partial: 'users/friend_result'}
      end
      
    end
  end
end
