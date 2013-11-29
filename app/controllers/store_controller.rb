class StoreController < ApplicationController
  def index
    @random_products = Movieproduct.three_random_products
    @newest_products = Movieproduct.order('created_at DESC').limit(3)
  end

  def static_page
    if params.has_key?(:id) && params.has_key?(:permalink)
      page_id = params[:id]
      @page_content = Page.find(page_id)
    else
      redirect_to root_path
    end
  end

  def search_results
    if params.has_key?(:keywords) && params.has_key?(:category)
      keywords = params[:keywords]
      product_category = params[:category]

      #possible problem with paginating because you can only access search results with post
      if product_category.empty?
        @movieproduct_results = Movieproduct.joins(:movie).where(["movies.title LIKE ? OR movieproducts.description LIKE ?", "%#{keywords}%", "%#{keywords}%"]).order('movies.title').page(params[:page]).per(15)
      else
        @movieproduct_results = Movieproduct.joins(:movie).where("movieproducts.category_id = #{product_category}").where(["movies.title LIKE ? OR movieproducts.description LIKE ?", "%#{keywords}%", "%#{keywords}%"]).order('movies.title').page(params[:page]).per(15)
      end
    else
      redirect_to root_path
    end
  end

  def add_to_cart
    id = params[:id].to_i
    session[:shopping_cart] << id unless session[:shopping_cart].include?(id)
    redirect_to :action => :view_cart
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    redirect_to :action => :view_cart
  end

  def reset_cart
    session[:shopping_cart] = nil
    redirect_to :action => :index
  end

  def view_cart
  end

  def checkout
    @customer = Customer.new
    @provinces = Province.order(:name)
  end

  def place_order
    redirect_to :action => :index
  end
end