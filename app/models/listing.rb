class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
  acts_as_taggable
  mount_uploaders :images, AvatarUploader

  def taken_date
  	date = []
  	self.reservations.each do |val|
  		date += [*val.start_date.strftime..val.end_date.strftime]
  	end
  	date
  end
end
