class Movieproductorder < ActiveRecord::Base
  attr_accessible :movieproduct_id, :order_id, :price, :quantity

  belongs_to :order
  belongs_to :movieproduct

  validates :movieproduct_id, :order_id, :quantity, :presence => true,
                                                    :numericality => { :only_integer => true }
  validates :price, :presence => true,
                    :numericality => true
end
