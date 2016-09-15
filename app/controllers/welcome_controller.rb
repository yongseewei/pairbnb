class WelcomeController < ApplicationController
  before_action :authenticate_user

  def home
  	# @code = "123"
  end

  private

  def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end
end
