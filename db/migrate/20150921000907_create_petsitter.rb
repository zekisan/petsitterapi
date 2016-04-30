class CreatePetsitter < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
    end

    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :entity_type
      t.integer :entity_id
      t.string :device_token

      t.references :photo
    end

    create_table :pet_owners do |t|
      t.string :name
      t.string :address
      t.string :district
      t.decimal :latitude, precision: 18, scale: 16
      t.decimal :longitude, precision: 18, scale: 16

      t.references :photo
    end

    create_table :sitters do |t|
      t.string :name
      t.string :address
      t.string :district
      t.text :about_me
      t.decimal :value_hour, precision: 5, scale: 2
      t.decimal :latitude, precision: 18, scale: 16
      t.decimal :longitude, precision: 18, scale: 16

      t.references :photo
    end
  end
end
