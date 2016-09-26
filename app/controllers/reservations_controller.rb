class ReservationsController < ApplicationController
	before_action :authenticate_user, only: [:index]
	def index
		if params[:user_id]
			@show_user_listing = true
			@user = User.find(params[:user_id])
			redirect_to root_path, notice: "You are not allowed to enter this page!" if @user != current_user
			@reservations = current_user.reservations
		elsif params[:listing_id]
			@show_user_listing = false
			@list = Listing.find(params[:listing_id])
			redirect_to root_path, notice: "You are not allowed to enter this page!" if @list.user != current_user
			@reservations = @list.reservations
		end
	end

	def show
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reserve_params)
		@list = @reservation.listing
		if @reservation.valid?
			redirect_to new_listing_transaction_path(@list, reserve_params)
			# ReservationMailer.booking_email(current_user,@list.user,@reservation.id).deliver_later
      # redirect_to user_reservations_path(current_user)
    else
			@date = @list.taken_date
			@images = @list.images.sample(4)
      render 'listings/show'
    end
	end

	private

	def reserve_params
		params[:reservation][:listing_id]=params[:listing_id]
		params[:reservation][:user_id]=current_user.id
		params.require(:reservation).permit(:guest, :end_date, :start_date, :user_id, :listing_id)
		# params.permit(:listing_id)
	end

	def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end
end
