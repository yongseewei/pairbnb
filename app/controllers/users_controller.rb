class UsersController < Clearance::UsersController

	def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end


 	private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :birthday, :email, :password)
  end

end
