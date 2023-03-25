class AddNameToSpots < ActiveRecord::Migration[7.0]
  def change
    add_column :spots, :name, :string
  end
end
