class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
    @our_tables = @restaurant.tables
  end

  def create
    @restaurant = Restaurant.new(name:        params[:name],
                                 description: params[:description],
                                 address:     params[:address],
                                 phone:       params[:phone])
    if @restaurant.save
      redirect_to restaurants_path
    else
      redirect_to new_restaurant_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
