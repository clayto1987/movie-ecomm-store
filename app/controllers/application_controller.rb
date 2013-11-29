class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_pages, :initialize_cart

  protected
  def load_pages
    @pages = Page.order(:title)
  end

  def initialize_cart
      session[:shopping_cart] ||= []
      @cart_products = []
      session[:shopping_cart].each{|id| @cart_products << Movieproduct.find(id)}
  end
end
