module ListingsHelper
	def check_ajax
		if request.xhr?
			tag = []
			tag << "non-smoker" if params[:non_smoker] == "true"
			tag << "non-pet" if params[:non_pet] == "true"
			@lists_js = []
			# byebug
			if tag != []
				@lists.each do |list|
					@lists_js << list if (list.tag_list & tag).sort == tag.sort
				end
			else
				@lists_js = @lists
			end
    end
	end
end
