class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
    @tables = @restaurant.tables
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
