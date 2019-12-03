class HomeController < ApplicationController
  def index
    # @order = current_user.orders.draft.first || Order.new
    @order = Order.draft.first || Order.new
    @products = Product.all
  end
end
