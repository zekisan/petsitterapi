class AddLatLongToPetOwner < ActiveRecord::Migration
  def change
    add_column :pet_owners, :latitude, :decimal, precision: 18, scale: 16
    add_column :pet_owners, :longitude, :decimal, precision: 18, scale: 16
  end
end
