class AddPhotoToPet < ActiveRecord::Migration
  def change
    add_reference :pets, :photo
  end
end
