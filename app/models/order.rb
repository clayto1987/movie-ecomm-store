class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst_rate, :hst_rate, :pst_rate, :status
  belongs_to :customer
  has_many :movieproductorders
  has_many :movieproducts, :through => :movieproductorders
end
#do inclusion for status
