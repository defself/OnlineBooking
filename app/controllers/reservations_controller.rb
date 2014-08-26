class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(start_time: params[:reservation][:start_time],
                                   end_time:   params[:reservation][:end_time],
                                   table_id:   params[:table_id])
    if @reservation.save
      redirect_to restaurants_path
    else
      redirect_to new_restaurant_reservation_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
