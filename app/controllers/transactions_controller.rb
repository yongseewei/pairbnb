class TransactionsController < ApplicationController
  before_action :authenticate_user
  before_action :check_user

  def new
  	@list = Listing.find(params[:listing_id])
  	@price = @list.rate*(params[:end_date].to_date - params[:start_date].to_date).to_i
 		gon.client_token = generate_client_token
	end

	def create
		@list = Listing.find(params[:listing_id])
		@result = Braintree::Transaction.sale(
              amount: @list.rate*(params[:end_date].to_date - params[:start_date].to_date).to_i,
              payment_method_nonce: params[:payment_method_nonce])
		@reservation = current_user.reservations.build(reserve_params)
    if @reservation.valid? && @result.success?
    	@reservation.save
    	ReservationMailer.booking_email(current_user,@list.user,@reservation.id).deliver_later
      redirect_to root_url, notice: "Congraulations! Your transaction is successful!"
    else
      redirect_to new_listing_transaction_path(@list, reserve_params), notice: "Something went wrong while processing your transaction. Please try again!"
    end
	end

	private
	def generate_client_token
	  Braintree::ClientToken.generate
	end

	def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end

  def check_user
  	redirect_to listing_path(Listing.find(params[:listing_id])) if reserve_params.length != 4
  end

  def reserve_params
  	params.permit(:guest, :end_date, :start_date, :listing_id)
  end
end
