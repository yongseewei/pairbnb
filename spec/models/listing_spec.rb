require 'rails_helper'

RSpec.describe Listing, type: :model do
	let(:title)				{ 'Best House' }
	let(:description)	{ 'Best House in town' }
	let(:rate)				{ 30 }
	let(:user_id) 		{ 2 }

	context "validation: " do
		it { is_expected.to validate_presence_of(:title)}
		it { is_expected.to validate_presence_of(:description)}
		it { is_expected.to validate_presence_of(:rate)}
		it { is_expected.to validate_presence_of(:user_id)}
		it { is_expected.to belong_to(:user)}
		it { is_expected.to have_many(:reservations)}
	end

	context "creates:" do
		it "can create when valid params are given" do
			expect{ Listing.create(title: title, description: description, rate: rate, user_id: user_id)}.not_to raise_error
			expect( Listing.find_by(title: title) ).not_to be nil
		end
	end
end