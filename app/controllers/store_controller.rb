class StoreController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def search_results
    keywords = params[:keywords]
    product_category = params[:category][:filter]

    #possible problem with paginating because you can only access search results with post
    if product_category.empty?
      @movieproduct_results = Movieproduct.joins(:movie).where(["movies.title LIKE ? OR movieproducts.description LIKE ?", "%#{keywords}%", "%#{keywords}%"]).order('movies.title').page(params[:page]).per(15)
    else
      @movieproduct_results = Movieproduct.joins(:movie).where("movieproducts.category_id = #{product_category}").where(["movies.title LIKE ? OR movieproducts.description LIKE ?", "%#{keywords}%", "%#{keywords}%"]).order('movies.title').page(params[:page]).per(15)
    end
  end
end