class StocksController < ApplicationController
    
    def search 
        
        @stock = Stock.new_lookup(params[:stock])
        #render json: @stock
        render 'users/my_porfolio'
        
    end
end