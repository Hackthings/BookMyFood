class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    render layout: false
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url, notice: 'Product was successfully created.'
    else
      render_failure(@product)
    end
  end

  def edit
    render layout: false
  end

  def update
    if @product.update(product_params)
      redirect_to products_url, notice: 'Product was successfully updated.'
    else
      render_failure(@product)
    end
  end

  def show
    render layout: false
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :available, :image)
    end
end
