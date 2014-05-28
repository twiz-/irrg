class RemoveReviewIdFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :review_id, :integer
  end
end
