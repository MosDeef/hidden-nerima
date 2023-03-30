class RemoveColumnTypeFormSpots < ActiveRecord::Migration[7.0]
  def change
    remove_column :spots, :type
    add_column :spots, :sub_category, :string
  end
end
