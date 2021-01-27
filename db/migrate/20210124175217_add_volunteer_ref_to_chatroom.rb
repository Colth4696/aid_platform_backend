class AddVolunteerRefToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :volunteer, foreign_key: true
  end
end
