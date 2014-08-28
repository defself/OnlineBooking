class TablesController < ApplicationController
  def create
    restaurant = Restaurant.find_by_id(params[:restaurant_id])
    table = Table.new(number: restaurant.tables.size + 1)
    redirect_to :back if restaurant.tables << table
  end
end
