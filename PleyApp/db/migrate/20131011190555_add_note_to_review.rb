class AddNoteToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :note, :text
  end
end
