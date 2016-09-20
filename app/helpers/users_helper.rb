module UsersHelper
	 def correct_user?
  	user = @list.user.id
    if user != current_user.id
      return false
    else
    	return true
    end
  end
end
