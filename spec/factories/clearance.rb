FactoryGirl.define do
  sequence :email do |n|
  	a = SecureRandom.base64[0..3]
    "user#{a}@example.com"
  end

  factory :user do
    email
    password "password"
  end
end
