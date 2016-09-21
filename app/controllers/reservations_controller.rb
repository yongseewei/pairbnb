class ReservationsController < ApplicationController
	def index
		@reservations = current_user.reservations
	end

	def show
	end

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reserve_params)
		if @reservation.save
      redirect_to user_reservations_path(current_user)
    else
    	@list = @reservation.listing
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
end
