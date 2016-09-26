class ReservationMailer < ApplicationMailer
  default from: ENV["APP_EMAIL"]

  def booking_email(customer, host, reservation_id)
    @customer = customer
    @host = host
    @url = "http://localhost:3000/listings/#{reservation_id}/reservations"
	  mail(to: @host.email, subject: 'Confirmation of booking from PairBnB')
  end
end
