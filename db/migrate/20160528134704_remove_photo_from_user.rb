class RemovePhotoFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :photo_id
  end
end
