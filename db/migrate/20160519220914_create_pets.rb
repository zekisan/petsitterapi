class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :size
      t.decimal :weight, precision: 6, scale: 3
      t.string :breed

      t.references :pet_owner
      t.references :animal
    end

    create_table :pet_cares do |t|
      t.string :care

      t.references :pet
    end
  end
end
