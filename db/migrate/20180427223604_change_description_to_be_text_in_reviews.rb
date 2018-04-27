class ChangeDescriptionToBeTextInReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :description, :text
  end
end
