class Page < ActiveRecord::Base
  attr_accessible :content, :permalink, :title
  validates :title, :content, :permalink, :presence => :true
end
