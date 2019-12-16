class Cart::ProductsController < ApplicationController
    
  def validate_params 
    permitted_params.values.each do |p|
      unless /\A[-+]?\d+\z/ === p
        return false
      end
    end
    return true
  end
 
  def create

    if permitted_params[:product_id].nil?  
      
      render :json => {:code => invalid_param_error(0)[:code],
      
      :message => invalid_param_error(0)[:message],
      
      :name => invalid_param_error(0)[:name]}, :status => 400
    
    elsif permitted_params[:quantity].nil?
      
      render :json => {:code => invalid_param_error(1)[:code],
      
      :message => invalid_param_error(1)[:message],
      
      :name => invalid_param_error(1)[:name]}, :status => 400
    
    else
      
      if validate_params
        
        @product = Product.find(permitted_params[:product_id])

        add_product @product, permitted_params[:quantity].to_i

        render :status => 200
       
      else 

        render :json => "Error", :status => 400 

      end
    end

  end

  def destroy
    if validate_params
      @product = Product.find(permitted_params[:id])
    
      delete_product @product
    else

      render :json => "Error", :status => 400 

    end
  end


  private 
  def permitted_params
    params.permit(:product_id, :quantity, :id)
  end
end