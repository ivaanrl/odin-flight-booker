class PassengerMailer < ApplicationMailer
  default from: 'bookkings@example.com'

  def successful_booking
    @user = params[:booking].passengers.first
    @url = "http://localhost:3000/bookings/#{params[:booking].id}"
    mail(to: @user.email, subject: 'Booking information')
  end

    
end
