class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :listings
  has_many :reservations
  has_many :messages

  mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
    # name = auth_hash["info"]["name"].split(" ")
    # byebug
    # o = [('a'..'z'), ('A'..'Z'),[*0..9]].map { |i| i.to_a }.flatten
    create! do |u|
      u.firstname = auth_hash["info"]["first_name"]
      u.lastname = auth_hash["info"]["last_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.password = [*('a'..'z'), *('A'..'Z'),*(0..9)].sample(8).join
      u.authentications<<(authentication)
      # byebug
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
