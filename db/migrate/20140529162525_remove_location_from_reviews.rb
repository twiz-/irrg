class RemoveLocationFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :location, :string
  end
end
