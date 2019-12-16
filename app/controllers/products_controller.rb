class ProductsController < ApplicationController
  def index
    @products = Product.all_products
      render :json => {"data": @products}
  end
end
