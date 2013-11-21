class MovieproductsController < ApplicationController
  def index
    #@movieproducts = Movieproduct.order('created_at DESC').page(params[:page]).per(15)
    @movieproducts = Movieproduct.joins(:movie).order('movies.title').page(params[:page]).per(15)
  end

  def show
    @movieproduct = Movieproduct.find(params[:id])
  end

  def newest_products
    current_year = Time.now.year
    @newproducts = Movieproduct.joins(:movie).order('movies.title').where(:movies => {:year => current_year}).page(params[:page]).per(15)
  end

  def updated_products
    @updatedproducts = Movieproduct.order(:updated_at).limit(15)
  end
end