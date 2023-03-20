class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :location
      t.text :description
      t.integer :category
      t.string :hours_open
      t.string :type

      t.timestamps
    end
  end
end
