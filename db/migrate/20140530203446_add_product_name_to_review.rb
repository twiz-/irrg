class AddProductNameToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :product_name, :string
  end
end
