class ListingsController < ApplicationController
	before_action :find_list, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!, except: [:index, :show]

	def index
		@lists = Listing.all.order("created_at DESC")
	end

	def show

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
	end

	def destroy
	end

	private

	def list_params
		params.require(:listing).permit(:title, :description)
	end

	def find_list
		@list = Listing.find(params[:id])
	end
end
