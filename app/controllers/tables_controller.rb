class TablesController < ApplicationController
  def create
    restaurant = Restaurant.find params[:restaurant_id]
    table = Table.new(number: restaurant.tables.size + 1)
    if restaurant.tables.size >= 100
      redirect_to :back, alert: "Restaurant is full"
    elsif restaurant.tables << table
      redirect_to :back
    else
      redirect_to :back, alert: table.errors.full_messages
    end
  end
end
