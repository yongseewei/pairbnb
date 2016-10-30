class ReservationsController < ApplicationController
	include ListingsHelper
	before_action :authenticate_user, only: [:index]
	def index
		if params[:user_id]
			@show_user_listing = true
			@reservations = current_user.reservations			
		elsif params[:listing_id]
			@show_user_listing = false
			@list = current_user.listings.find_by(id: params[:listing_id])
			redirect_to root_path, notice: "You are not allowed to enter this page!" unless @list	
			@reservations = @list.reservations	if @list
		end
	end

	def show
	end

	def new
		@reservation = current_user.reservations.build
	end

	def create
		@reservation = current_user.reservations.build(reserve_params)
		@list = @reservation.listing
		if @reservation.valid?
			redirect_to new_listing_transaction_path(@list, reserve_params)
    else
			gon.reservations = taken_date
			@images = @list.images.sample(4)
      render 'listings/show'
    end
	end

	private
	def reserve_params
		params.require(:reservation).permit(:guest, :end_date, :start_date, :listing_id)
	end

	def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end
end
