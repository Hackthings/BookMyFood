class HomeController < ApplicationController
  def index
    @order = current_user.orders.draft.first || current_user.orders.new
    @order.order_items.build
    @products = Product.all
  end
end
