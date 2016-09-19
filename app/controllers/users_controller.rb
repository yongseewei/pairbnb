class UsersController < Clearance::UsersController

	def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user

      redirect_back_or url_after_create
    else
      redirect_to sign_up_path, notice: "Sign up fail!"
    end
  end

  def index

  end

 	private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :birthday, :email, :password)
  end

end
