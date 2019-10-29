class AddAirportsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_reference :flights, :departure_airport
    add_reference :flights, :arrival_airport
  end
end
