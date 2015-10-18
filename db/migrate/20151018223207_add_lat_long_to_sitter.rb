class AddLatLongToSitter < ActiveRecord::Migration
  def change
    add_column :sitters, :latitude, :decimal, precision: 18, scale: 16
    add_column :sitters, :longitude, :decimal, precision: 18, scale: 16
  end
end
