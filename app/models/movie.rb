class Movie < ActiveRecord::Base
  attr_accessible :genre, :rating, :runtime, :title, :year
end
