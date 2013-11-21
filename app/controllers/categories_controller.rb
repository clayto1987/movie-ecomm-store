class CategoriesController < ApplicationController
  def index
    #@category = Category.find(params[:id])
    @category = Category.where("name = ?", "#{params[:name]}").first
    @category_movieproducts = @category.movieproducts
  end
end
