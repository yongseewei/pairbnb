class WelcomeController < ApplicationController
  before_action :authenticate_user

  def home
  end

  private

  def authenticate_user
  	redirect to sign_in_path if signed_out?
  end
end
