class StoreController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def search_results
    keywords = params[:keywords]
    @movieproduct_results = Movieproduct.joins(:movie).where(["movies.title LIKE ? OR movieproducts.description LIKE ?", "%#{keywords}%", "%#{keywords}%"]).order('movies.title').page(params[:page]).per(15)
  end
end