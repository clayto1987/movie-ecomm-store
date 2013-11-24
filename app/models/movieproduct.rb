class Movieproduct < ActiveRecord::Base
  attr_accessible :description, :movie_id, :price, :stock_quantity, :image_path, :category_id

  has_many :movieproductorders
  has_many :orders, :through => :movieproductorders
  belongs_to :movie
  belongs_to :category

  validates :movie_id, :stock_quantity, :category_id, :presence => true,
                                                      :numericality => { :only_integer => true }
  validates :price,        :presence => true,
                           :numericality => true
  validates :description, :length => { :maximum => 255 }

  def self.three_random_products
    Movieproduct.limit(3).offset(rand(Movieproduct.count-4))
  end
end