class UserStocksController < ApplicationController
    def create 
        
        stock = Stock.check_db(params[:ticker])
        
        if stock.blank?
           stock = Stock.new_lookup(params[:ticker])
           stock.save
        end
        
           @user_stocks = UserStock.create(user: current_user, stock: stock)
            if @user_stocks
               flash[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
               redirect_to my_porfolio_path
            else
               flash[:notice] = "Stock #{stock.name} was not successfully added to your portfolio"
               redirect_to my_porfolio_path
            end
            
    end
end
