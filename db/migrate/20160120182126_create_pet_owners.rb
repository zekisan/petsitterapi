class CreatePetOwners < ActiveRecord::Migration
  def change
    create_table :pet_owners do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
