class Movieproductorder < ActiveRecord::Base
  attr_accessible :movieproduct_id, :order_id, :price, :quantity
  belongs_to :order
  belongs_to :movieproduct
end
