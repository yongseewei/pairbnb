class ListingsController < ApplicationController
	include ListingsHelper
	before_action :find_list, only: [:edit, :update, :destroy]
	before_action :authenticate_user, except: [:index, :show]

	def index
		@search = params[:query].presence || "*"
		@lists = Listing.search(@search,order: [{created_at: {order: :desc, ignore_unmapped: true}}], fields: [:title, :tags_name], match: :word_start)
		check_ajax
		respond_to do |format|
      format.js # index.js.erb
      format.html # index.html.erb
    end
	end

	def autocomplete
    render json: Listing.search(params[:query] , autocomplete: true, limit: 10)
    .map {|listing| {title: listing.title, value: listing.id}}
  end

	def show
		# byebug
		# @messages = current_user.messages.build(body: "12312312312")
		# @messages.save
		@message = Message.new
		@list = Listing.find(params[:id])	
		gon.reservations = taken_date
		@images = @list.images.sample(4)
		@reservation = Reservation.new
	end

	def new
		@list = current_user.listings.build
	end

	def create
		@list = current_user.listings.build(list_params)
		redirect_to @list, notice: "Successfully saved!" if @list.save
	end

	def edit
	end

	def update
		redirect_to @list, notice: "List was Successfully updated!" if @list.update(list_params)
	end

	def destroy
		@list.destroy
		redirect_to listings_path
	end

	private

	def list_params
		params.require(:listing).permit(:title, :rate, :description, :tag_list, {images: []})
	end

	def find_list
		@list = current_user.listings.find_by(id: params[:id])
		redirect_to :back, :notice => "You are not allowed to edit this listing" unless @list
	end

	def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end
end
