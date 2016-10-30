module ListingsHelper
	def check_ajax
		if request.xhr?
			tag, @lists_js = [], []
			tag << "non-smoker" if params[:non_smoker] == "true"
			tag << "non-pet" if params[:non_pet] == "true"
			if tag != []
				@lists.each do |list|
					@lists_js << list if (list.tag_list & tag).sort == tag.sort
				end
			else
				@lists_js = @lists
			end
    end
	end

	def taken_date
  	date_s, date_e = [], []
  	@list.reservations.each do |val|
  		date_s += [*val.start_date...val.end_date]
      date_e += [*(val.start_date+1)..val.end_date]
  	end
  	[date_s,date_e]
  end
end
