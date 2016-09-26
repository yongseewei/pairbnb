class TransactionsController < ApplicationController
  before_action :authenticate_user
  before_action :check_user
  # before_action :check_cart!

  def new
  	@list = Listing.find(params[:listing_id])
  	@params = reserve_params
  	@price = @list.rate*(params[:end_date].to_date - params[:start_date].to_date).to_i
 		gon.client_token = generate_client_token
	end

	def create
		@list = Listing.find(params[:listing_id])
		@price = @list.rate*(params[:end_date].to_date - params[:start_date].to_date).to_i
		@result = Braintree::Transaction.sale(
              amount: @price,
              payment_method_nonce: params[:payment_method_nonce])
		@reservation = Reservation.new(reserve_params)
    if @reservation.valid? && @result.success?
    	@reservation.save
    	ReservationMailer.booking_email(current_user,@list.user,@reservation.id).deliver_later
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
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
  	redirect_to listing_path(Listing.find(params[:listing_id])), 
  			notice: "You are not allowed to go to this page" if reserve_params.length != 5
  end

  def reserve_params
  	params.permit(:guest, :end_date, :start_date, :user_id, :listing_id)
  end
end
