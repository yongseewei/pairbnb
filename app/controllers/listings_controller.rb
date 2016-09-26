class ListingsController < ApplicationController
	before_action :find_list, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]
	before_action :authenticate_user, except: [:index, :show]

	def index
		@search = params[:search]
		if params[:search] == ""
			@lists = Listing.all.order("created_at DESC")
		else
			@lists = Listing.search({:tags_name_in=>params[:search].capitalize}).result.order("created_at DESC")
		end

		if request.xhr?
			tag = []
			tag << "non-smoker" if params[:non_smoker] == "true"
			tag << "non-pet" if params[:non_pet] == "true"
			@lists_js = @lists
			@lists_js = @lists.tagged_with(tag).order("created_at DESC") if tag != []
    end
		respond_to do |format|
      format.js # index.js.erb
      format.html # index.html.erb
    end 
	end

	def show
		# byebug
		gon.client_token = generate_client_token
		gon.reservations = @list.taken_date

		@images = @list.images.sample(4)
		@reservation = Reservation.new
	end

	def new
		@list = current_user.listings.build
	end

	def create
		@list = current_user.listings.build(list_params)
		if @list.save
			redirect_to @list, notice: "Successfully saved!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @list.update(list_params)
			redirect_to @list, notice: "List was Successfully updated!"
		else
			render 'edit'
		end
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
		@list = Listing.find(params[:id])
	end

	def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end

  def correct_user
  	user = @list.user.id
    if user != current_user.id
      redirect_to @list, :notice => "You are not allowed to edit this listing"
    end
  end

  def generate_client_token
	  Braintree::ClientToken.generate
	end
end
