class CreateCareSitters < ActiveRecord::Migration
  def change
    create_table :care_sitters do |t|
      t.references :care, index: true
      t.references :sitter, index: true

      t.timestamps null: false
    end
  end
end
