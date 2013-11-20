class MovieproductsController < ApplicationController
  def index
    @movieproducts = Movieproduct.all
  end
end
