class WelcomeController < ApplicationController
  before_action :authenticate_user

  def home
  	# @code = "123"

  	# @code = ENV["pusher_app_id"]
  end

  private

  def authenticate_user
  	redirect_to sign_in_path if signed_out?
  end
end
