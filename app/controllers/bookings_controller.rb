class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.character = Character.find(params[:character_id])
    @booking.user = current_user

    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def set_status
  end

  def destroy
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def host_bookings
    raise
    @bookings = Booking.where(character: current_user)
  end

  def host_booking
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :character_id)
  end
end
