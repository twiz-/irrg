class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :product_image
      t.string :email
      t.string :location
      t.text :comment
      t.string :reviewer_image

      t.timestamps
    end
  end
end
