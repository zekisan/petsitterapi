class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :sitter
      t.references :pet_owner
      t.time :date_start
      t.time :date_final
      t.string :time_start
      t.string :time_final

      t.timestamps
    end
  end
end
