Airport.create(name: 'SFO')
Airport.create(name: 'NYC')
def flying_time
  total = rand(6200..44000)
  hours = total/3600

  total -= hours * 3600

  minutes = total/60

  total -= minutes*60

  '%02d:%02d:%02d' % [hours, minutes, total]
end
50.times do 
  departure_time = Faker::Time.between(DateTime.now, DateTime.now + 72)
  flight_time = flying_time
  departure_airport = Airport.order('RANDOM()').take
  arrival_airport = Airport.where.not(id: departure_airport.id).order('RANDOM()').take
  while arrival_airport == departure_airport
    arrival_airport = airports.sample
  end
  Flight.create(departure_time: departure_time,
                departure_airport: departure_airport, arrival_airport: arrival_airport)
end