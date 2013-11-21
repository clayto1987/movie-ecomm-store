class StoreController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def search_results
    @movieproduct_results = Movieproduct.joins(:movie).where("movies.title LIKE ?", "%#{params[:keywords]}%")
  end
end