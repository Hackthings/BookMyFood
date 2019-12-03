class HomeController < ApplicationController
  def index
    @order = Order.draft || Order.new
    @products = Product.all
  end
end
