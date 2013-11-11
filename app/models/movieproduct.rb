class Movieproduct < ActiveRecord::Base
  attr_accessible :description, :movie_id, :price, :product_type, :stock_quantity, :image_path

  has_many :movieproductorders
  has_many :orders, :through => :movieproductorders
  belongs_to :movie

  validates :movie_id, :stock_quantity, :presence => true,
                                        :numericality => { :only_integer => true }
  validates :price,        :presence => true,
                           :numericality => true
  validates :product_type, :presence => true,
                           :inclusion => { :in => %w(blu-ray dvd poster), :message => "%{value} is not a valid product" }
  validates :description, :length => { :maximum => 255 }
end