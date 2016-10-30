class Message < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :body, :user_id, :status
end