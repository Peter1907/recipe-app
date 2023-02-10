class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.where(user: current_user)
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new(params.require(:food).permit(:name, :measurement_unit, :price, :quantity))
    food.user = current_user

    if food.save
      flash[:success] = 'Ingredient added successfully'
    else
      flash.now[:error] = 'Error: Ingredient could not be added'
    end
    redirect_to foods_path
  end

  def destroy
    Food.destroy(params[:id])
    flash[:notice] = 'Food deleted'
    redirect_to foods_path
  end
end
