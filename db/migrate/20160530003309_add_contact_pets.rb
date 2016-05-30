class AddContactPets < ActiveRecord::Migration
  def change
    create_table :contact_pets do |t|
      t.references :pet, index: true
      t.references :contact, index: true
    end
  end
end
