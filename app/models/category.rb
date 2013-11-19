class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :movieproducts

  validates :name, :presence => true
end
