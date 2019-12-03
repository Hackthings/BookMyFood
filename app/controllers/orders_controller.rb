class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    render layout: false
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_url, notice: 'Order was successfully created.'
    else
      render_failure(@order)
    end
  end

  def edit
    render layout: false
  end

  def update
    if @order.update(order_params)
      redirect_to orders_url, notice: 'Order was successfully updated.'
    else
      render_failure(@order)
    end
  end

  def show
    render layout: false
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :payment_mode, :status, :total, order_items_attributes: [:product_id, :quantity])
    end
end
