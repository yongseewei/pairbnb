class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
  acts_as_taggable
  mount_uploaders :images, ListingUploader

  def taken_date
  	date = []
  	self.reservations.each do |val|
  		date += [*val.start_date...val.end_date]
  	end
  	date
  end
end
