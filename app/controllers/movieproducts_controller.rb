class MovieproductsController < ApplicationController
  def index
    @movieproducts = Movieproduct.all
  end

  def show
    @movieproduct = Movieproduct.find(params[:id])
  end
end
