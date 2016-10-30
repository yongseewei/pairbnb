class UsersController < Clearance::UsersController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
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

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was Successfully updated!"
    else
      render 'edit'
    end
  end

 	private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :birthday, :email, :password, :avatar)
  end

end
