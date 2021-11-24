class StocksController < ApplicationController
    
    def search 
        
        if params[:stock].present?
            
         @stock = Stock.new_lookup(params[:stock])
        
            if @stock
                #render json: @stock
                #render 'users/my_porfolio'
                
                #response to ajax request
                
                respond_to do |format|
                   format.js { render partial: 'users/result' }
                end
                
            else
                flash[:alert] = "Please enter a valid symbol to search"
                redirect_to my_porfolio_path
            end
                    
        else
            flash[:alert] = "Please enter a symbol to search"
            redirect_to my_porfolio_path
        end
        
    end
end