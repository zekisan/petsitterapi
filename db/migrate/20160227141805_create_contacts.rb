class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :sitter
      t.references :pet_owner
      t.string :date_start
      t.string :date_final
      t.string :time_start
      t.string :time_final

      t.timestamps
    end
  end
end
