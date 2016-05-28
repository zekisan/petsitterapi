class RemovePetCares < ActiveRecord::Migration
  def change
    drop_table :pet_cares

    add_column :pets, :pet_care, :string
  end
end
