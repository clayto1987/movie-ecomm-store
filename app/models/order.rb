class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst_rate, :hst_rate, :pst_rate, :status

  belongs_to :customer
  has_many :movieproductorders
  has_many :movieproducts, :through => :movieproductorders

  validates :gst_rate, :pst_rate, :hst_rate, :numericality => { :greater_than_or_equal_to => 0.00,
                                                                :less_than_or_equal_to => 1.00,
                                                                :allow_nil => true }
  validates :customer_id, :presence => true,
                          :numericality => { :only_integer => true }
  validates :status,      :presence => true,
                          :inclusion => { :in => %w(new processed shipped delivered returned error), :message => "%{value} is not a valid status" }
end