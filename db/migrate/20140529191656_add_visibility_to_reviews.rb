class AddVisibilityToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :visibility, :boolean
  end
end
