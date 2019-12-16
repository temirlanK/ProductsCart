module ErrorMessages

  def invalid_request_error 
    @error = { :error =>
      {
          :type => "invalid_request_error",
          :message => "Unable to resolve the request \"api\/info\"."
      } 
    }
  end

  def invalid_param_error num
    @error = {:error => 
        {:params => [
          {:code => :required, :message => "Product cannot be blank", :name => :product_id},
          {:code => :required, :message => "Quantity cannot be blank", :name => :quantity}],
         :type => "invalid_param_error",
         :message => "Invalid data parameters"}
    }
    @error[:error][:params][num]
  end

  def numerical_parameter_error
    {:error => "Parameter is not numerical"}
  end

  def not_existing_product_error 
    {:error => "Такого продукта нет в системе"}
  end
end