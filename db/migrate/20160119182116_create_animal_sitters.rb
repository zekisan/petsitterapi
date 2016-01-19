class CreateAnimalSitters < ActiveRecord::Migration
  def change
    create_table :animal_sitters do |t|
      t.references :animal, index: true
      t.references :sitter, index: true

      t.timestamps null: false
    end
  end
end
