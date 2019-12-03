class HomeController < ApplicationController
  def index
    # @order = current_user.orders.draft.first || Order.new
    @order = Order.draft.first || Order.new
    @order.order_items.build
    @products = Product.all
  end
end
