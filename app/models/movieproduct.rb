class Movieproduct < ActiveRecord::Base
  attr_accessible :description, :movie_id, :price, :stock_quantity, :image_path, :category_id

  has_many :movieproductorders
  has_many :orders, :through => :movieproductorders
  belongs_to :movie
  belongs_to :category

  validates :movie_id, :stock_quantity, :presence => true,
                                        :numericality => { :only_integer => true }
  validates :price,        :presence => true,
                           :numericality => true
  validates :description, :length => { :maximum => 255 }
end