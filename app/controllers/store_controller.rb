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
    flash[:product_added] = '1 Movie Product added to your Cart'
    redirect_to :action => :view_cart
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    flash[:product_removed] = '1 Movie Product removed from your Cart'
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
    #order_total = 0.0
    #error_msg = 'A database error occurred and your order was not submitted, please try again.'

    @customer = Customer.new(params[:customer])
    @customer.save

    @order = @customer.orders.build

    @order.gst_rate = @customer.province.gst
    #gst = @customer.province.gst
    @order.pst_rate = @customer.province.pst
    #pst = @customer.province.pst
    @order.hst_rate = @customer.province.hst
    #hst = @customer.province.hst
    @order.status = 'new'

    @order.save

    #if @order.errors.any?
    #  flash.now[:error] = error_msg
    #  render :action => :checkout
    #end

    session[:shopping_cart].each do |id|
      movie_product = Movieproduct.find(id)

      movie_product_order = @order.movieproductorders.build
      movie_product_order.movieproduct = movie_product
      movie_product_order.price = movie_product.price
      movie_product_order.quantity = movie_product.stock_quantity

      #order_total += movie_product_order.price

      movie_product.stock_quantity -= 1

      movie_product.save
      movie_product_order.save

      #if movie_product.errors.any? || movie_product_order.errors.any?
      #  flash.now[:error] = error_msg
      #  render :action => :checkout
      #end
    end

    #order_total += (order_total * pst) + (order_total * gst) + (order_total * hst)

    session[:shopping_cart] = nil
    flash[:completed_order] = "Thank You for your order, it is being processed and will be shipped very soon"
    redirect_to :action => :index
  end

  def test
    @customer = Customer.new(params[:customer])
  end
end