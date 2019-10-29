class BookingsController < ApplicationController

  def new
    @booking = Booking.new(flights_id: params[:flight])
    @flight = Flight.find_by(id: @booking.flights_id)
    params[:num_passengers].to_i.times { @booking.passengers.build(flight_id: @booking.flights_id)}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      
      flash[:success] = "Flight booked successfully! "
      redirect_to booking_path(@booking)
    else
      flash[:error] = "Something went wrong. Try again."
      render 'new'
    end
  end

  def show 
    @flight = Flight.find_by(id: params[:id])
    @booking = Booking.find_by(id: @flight.id)
    
    PassengerMailer.with(booking: @booking).successful_booking.deliver_now
  end

  private

   def booking_params
      params.require(:booking).permit(:flights_id, passengers_attributes: [:name, :email, :flight_id])
   end
end
