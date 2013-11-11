class Movie < ActiveRecord::Base
  attr_accessible :genre, :rating, :runtime, :title, :year

  has_many :movieproducts

  validates :rating,  :inclusion => { :in => %w(G PG PG-13 R NC-17), :message => "%{value} is not a valid MPAA movie rating" }
  validates :runtime, :numericality => { :only_integer => true }
  validates :title,   :presence => true,
                      :uniqueness => true
  validates :year,    :numericality => { :only_integer => true },
                      :length => { :is => 4 }
end