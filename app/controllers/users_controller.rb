class UsersController < ApplicationController
  def my_porfolio
    @tracked_stocks = current_user.stocks
  end
end
