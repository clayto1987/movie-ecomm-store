class Movieproduct < ActiveRecord::Base
  attr_accessible :description, :movie_id, :price, :product_type, :stock_quantity
end
