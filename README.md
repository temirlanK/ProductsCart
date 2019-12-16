# README
* Ruby version
  ruby 2.4.4p296 (2018-03-28 revision 63013) [x86_64-linux]

* Database creation
  Mysql Database. For more details look at config/database.yml 

* Database initialization, migration and seed
  rails db:create
  rails db:migrate
  rails db:seed
* Deployment instructions
  Run Server in a development mode via "rails s"
  
* API Specification: Routing (run rails routes)
  List of Products:           GET    /api/products(.:format)          products#index
  Add Product to Cart:        POST   /api/cart/products(.:format)     cart/products#create
  Delete Product from Cart:   DELETE /api/cart/products/:id(.:format) cart/products#destroy
  Get Cart Info:              GET    /api/cart(.:format)              carts#cart_info
