class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  # after_create_commit { NewMessageJob.perform_later(self)}
end
