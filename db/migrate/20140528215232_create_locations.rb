class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
