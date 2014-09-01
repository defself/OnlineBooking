class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find params[:id]
    @our_tables = @restaurant.tables
    # Add first table if restaurant is empty
    @restaurant.tables << Table.new(number: 1) if @our_tables.empty?
  end

  def create
    @restaurant = Restaurant.new name: params[:restaurant][:name]
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant was created successfully"
    else
      redirect_to new_restaurant_path, alert: "Restaurant was not created"
    end
  end

  def edit
    @restaurant = Restaurant.find params[:id]
  end

  def update
    @restaurant = Restaurant.find params[:id]
    @restaurant.name = params[:restaurant][:name]
    if @restaurant.save
      redirect_to root_path, notice: "Restaurant was successfully updated"
    else
      redirect_to :back, alert: @restaurant.errors.full_messages
    end
  end

  def destroy
    if Restaurant.find(params[:id]).destroy
      redirect_to root_path, notice: "Restaurant was successfully closed"
    else
      redirect_to root_path, alert: "Restaurant was not closed"
    end
  end
end
