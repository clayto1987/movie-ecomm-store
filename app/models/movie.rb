class Movie < ActiveRecord::Base
  attr_accessible :genre, :rating, :runtime, :title, :year
  has_many :movieproducts
end
