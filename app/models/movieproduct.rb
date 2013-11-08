class Movieproduct < ActiveRecord::Base
  attr_accessible :description, :movie_id, :price, :product_type, :stock_quantity, :image_path
  has_many :movieproductorders
  has_many :orders, :through => :movieproductorders
  belongs_to :movie
end
