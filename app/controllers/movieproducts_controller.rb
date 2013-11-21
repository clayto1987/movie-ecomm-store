class MovieproductsController < ApplicationController
  def index
    @movieproducts = Movieproduct.all
  end

  def show
    @movieproduct = Movieproduct.find(params[:id])
  end

  def newest_products
    current_year = Time.now.year
    @newproducts = Movieproduct.joins(:movie).where(:movies => {:year => current_year})
  end

  def updated_products
    @updatedproducts = Movieproduct.order(:updated_at).limit(15)
  end
end
