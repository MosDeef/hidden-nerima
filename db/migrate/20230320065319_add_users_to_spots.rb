class AddUsersToSpots < ActiveRecord::Migration[7.0]
  def change
    add_reference :spots, :user, index: true
    add_foreign_key :spots, :users
  end
end
