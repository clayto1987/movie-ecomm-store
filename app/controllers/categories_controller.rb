class CategoriesController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @category_movieproducts = @category.movieproducts
  end
end
