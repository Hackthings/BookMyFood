class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    render layout: false
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to foods_url, notice: 'Food was successfully created.'
    else
      render_failure(@food)
    end
  end

  def edit
    render layout: false
  end

  def update
    if @food.update(food_params)
      redirect_to foods_url, notice: 'Food was successfully updated.'
    else
      render_failure(@food)
    end
  end

  def show
    render layout: false
  end

  def destroy
    @food.destroy
    redirect_to foods_url, notice: 'Food was successfully destroyed.'
  end

  private
    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:name, :price, :available, :image)
    end
end
