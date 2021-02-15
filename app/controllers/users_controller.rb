class UsersController < ApplicationController
  def my_portfolio
    @tracked_Stocks = current_user.stocks
  end
end
