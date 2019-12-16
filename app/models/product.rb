class Product < ApplicationRecord
  scope :all_products, -> { select(:id, :name, :description, :price) }
end
