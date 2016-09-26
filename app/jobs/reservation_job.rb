class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # ReservationMailer.booking_email(*args).deliver_now
  end
end
