class StocksController < ApplicationController

    def search
      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])
        if @stock
          respond_to do |format|
            format.js { render partial: 'users/result' }
          end
        else
          respond_to do |format|
            flash.now[:alert] = "Please enter valid symbol"
                format.js { render partial: 'users/result' }
          end
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a symbol"
          format.js { render partial: 'users/result' }
        end
      end
    end
    
    def refresh
      stock=Stock.find(params[:format])
      updated_stock=Stock.new_lookup(stock.ticker)
      stock.update(last_price: updated_stock.last_price)
      redirect_to my_portfolio_path
    end
  end