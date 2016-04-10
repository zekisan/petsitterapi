class AddDistrictToPetOwner < ActiveRecord::Migration
  def change
    add_column :pet_owners, :district, :string
    add_column :pet_owners, :photo, :string
  end
end
