class ReservationsController < ApplicationController
  def index
    @restaurant = Table.find_by_id(params[:restaurant_id])
    @table = Table.find_by_id(params[:table_id])
    @reservations = @table.reservations
  end

  def new
    @reservation = Reservation.new
    @table = Table.find_by_id(params[:table_id])
  end

  def create
    @reservation = Reservation.new(start_time: params[:reservation][:start_time],
                                   end_time:   params[:reservation][:end_time],
                                   table_id:   params[:table_id])
    if @reservation.save
      redirect_to restaurants_path
    else
      redirect_to new_restaurant_table_reservation_path
    end
  end

  def edit
    @reservation = Reservation.find_by_id(params[:id])
  end

  def update
    @reservation = Reservation.find_by_id(params[:id])
    @reservation.start_time = params[:reservation][:start_time]
    @reservation.end_time   = params[:reservation][:end_time]
    if @reservation.save
      redirect_to restaurants_path
    else
      redirect_to :back
    end
  end

  def destroy
    redirect_to restaurants_path if Reservation.find_by_id(params[:id]).destroy
  end
end
