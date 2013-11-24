class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_pages

  protected
  def load_pages
    @pages = Page.order(:title)
  end
end
