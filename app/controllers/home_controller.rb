class HomeController < ApplicationController
  def index
    @categories = Category.all.order_by_name
  end
end
