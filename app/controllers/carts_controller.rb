class CartsController < ApplicationController
  def cart_info
    
    render :json => {:data => {:total_sum => total_sum,
     :products_count => products_count,
     :products => products}}
  end
end
