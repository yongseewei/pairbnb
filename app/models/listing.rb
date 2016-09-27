class Listing < ActiveRecord::Base
  searchkick  match: :word_start, autocomplete: ['title']
	belongs_to :user
	has_many :reservations
  acts_as_taggable
  mount_uploaders :images, ListingUploader

  def taken_date
  	date_s = []
    date_e = []
  	self.reservations.each do |val|
  		date_s += [*val.start_date...val.end_date]
      date_e += [*(val.start_date+1)..val.end_date]
  	end
  	[date_s,date_e]
  end

  def search_data
    attributes.merge(
    tags_name: tags.map(&:name)
    )
  end
end
