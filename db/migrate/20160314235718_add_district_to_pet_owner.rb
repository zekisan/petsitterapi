class AddDistrictToPetOwner < ActiveRecord::Migration
  def change
    add_column :pet_owners, :district, :string
  end
end
