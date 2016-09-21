class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validates :user_id, :presence => true
	validates :guest, :presence => true
	validates :start_date, :presence => true
	validates :end_date, :presence => true
	validate :check_date

	private

	def check_date
		empty = 0
		self.listing.reservations.each do |reserve|
			empty += 1 if (reserve.start_date..reserve.end_date).overlaps?(self.start_date..self.end_date)
		end
		if empty > 0
			errors.add(:date, "is not available")
		end
  end
end
