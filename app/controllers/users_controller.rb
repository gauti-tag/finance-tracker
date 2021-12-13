class UsersController < ApplicationController
  def my_porfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end
  
  def my_friends
    @tracked_friends = current_user.friends
  end
  
  def search 
    #render json: params[:friend]
    if params[:friend].present?
      
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      
      if @friends
         respond_to do |format|
           format.js { render partial: 'users/friend_result' }
         end
      else
         respond_to do |format|
           flash.now[:alert] = "Can not find friend"
           format.js {render partial: 'users/friend_result'}
         end
      end
      
    else 
      
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js {render partial: 'users/friend_result'}
      end
      
    end
  end
  
  def show
    #render json: {parameter: params[:id]}
    @user = User.find(params[:id])
    
    @tracked_stocks = @user.stocks
  end
end
