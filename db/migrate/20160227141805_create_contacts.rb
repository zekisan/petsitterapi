class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :sitter
      t.references :pet_owner

      t.timestamps
    end
  end
end
