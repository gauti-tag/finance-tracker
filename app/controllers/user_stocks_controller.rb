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
    
    
    def destroy 
        
        stock = Stock.find(params[:id])
        
        # get row from the relation table
        user_stock = UserStock.where(user_id: current_user.id, stock: stock.id).first
        
        user_stock.destroy
        flash[:notice] = "#{stock.ticker} was successfully removed form portfolio"
        redirect_to my_porfolio_path
    end
end
