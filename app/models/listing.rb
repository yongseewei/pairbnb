class Listing < ActiveRecord::Base
  searchkick  match: :word_start, autocomplete: ['title']
	belongs_to :user
	has_many :reservations
  acts_as_taggable
  mount_uploaders :images, ListingUploader

  validates :title, :presence => true
  validates :description, :presence => true
  validates :rate, :presence => true
  validates :user_id, :presence => true

  def search_data
    attributes.merge(
    tags_name: tags.map(&:name)
    )
  end
end
