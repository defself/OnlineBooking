class ReservationsController < ApplicationController
  def index
    @restaurant = Restaurant.find params[:restaurant_id]
    @table = Table.find params[:table_id]
    @reservations = @table.reservations
  end

  def new
    @reservation = Reservation.new
    @table = Table.find params[:table_id]
  end

  def create
    @reservation = Reservation.new(start_time: params[:reservation][:start_time],
                                   end_time:   params[:reservation][:end_time],
                                   table_id:   params[:table_id])
    if @reservation.save
      redirect_to root_path, notice: "You have successfully booked a table"
    else
      redirect_to new_restaurant_table_reservation_path, alert: @reservation.errors.full_messages
    end
  end

  def edit
    @reservation = Reservation.find params[:id]
  end

  def update
    @reservation = Reservation.find params[:id]
    @reservation.start_time = params[:reservation][:start_time]
    @reservation.end_time   = params[:reservation][:end_time]
    if @reservation.save
      redirect_to restaurant_path(params[:restaurant_id]), notice: "You have successfully booked a table"
    else
      redirect_to :back, alert: @reservation.errors.full_messages
    end
  end

  def destroy
    if Reservation.find(params[:id]).destroy
      redirect_to restaurant_path(params[:restaurant_id]), notice: "Reservation was canceled"
    else
      redirect_to root_path, alert: "Reservation was not canceled"
    end
  end
end
