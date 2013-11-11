class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst

  has_many :customers

  validates :gst, :pst, :hst, :numericality => { :greater_than_or_equal_to => 0.00,
                                                 :less_than_or_equal_to => 1.00,
                                                 :allow_nil => true }
  validates :name, :presence => true,
                   :uniqueness => true
end