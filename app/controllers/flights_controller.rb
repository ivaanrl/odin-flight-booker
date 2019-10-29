class FlightsController < ApplicationController
  def index
    @flight_date =  Flight.minimum(:departure_time).to_date
    if search = params[:flight]
      @flight_date = search[:departure_date]
      @departure_airport = search[:departure_airport_id]
      @arrival_airport = search[:arrival_airport_id]
      @num_passengers = params[:booking][:passengers]
      @flights = Flight.where( departure_airport_id: @departure_airport,
                arrival_airport_id: @arrival_airport, departure_time: @flight_date.to_date.all_day)
    end
  end


end
