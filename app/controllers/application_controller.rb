class ApplicationController < ActionController::API
  include ErrorMessages


  def add_product product, quantity
    @sum = product.price * quantity
    
    @product_id = product.id
    
    if products.pluck(:id).include?(@product_id)
      
      @product = products.select{ |product| product[:id] == @product_id}
      
      @product.last[:quantity] += quantity
      
      @product.last[:sum] += @sum 
    
    else
      
      products << { :id => @product_id, :quantity => quantity, :sum => @sum }

    end 
    
    cart_data_update
  end

  def cart_data_update

    session[:total_sum] = products.map{|x| x[:sum]}.sum
    
    session[:products_count] = products.map{|x| x[:quantity]}.sum

  end

 
  def delete_product product
    
    unless products.pluck(:id).include?(product.id)
      
      render :json => not_existing_product_error, :status => 400
    
    else
      @product = products.select{|x| x[:id] == product.id } 
      
      if @product.last[:quantity] == 1 
        
        products.delete_if{|x| x[:id] == product.id }
      
      else
        
        @product.last[:quantity] -= 1
        
        @product.last[:sum] -= product.price

      end
      
      cart_data_update
    end   
  end

  def total_sum
    session[:total_sum] ||= 0
    
    session[:total_sum]
  end

  def products
    session[:products] ||= []

    session[:products]
  end 

  def products_count
    session[:products_count] ||= 0

    session[:products_count]
  end 
  
end
