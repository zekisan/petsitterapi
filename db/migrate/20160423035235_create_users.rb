class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :photo
      t.boolean :logged
      t.integer :category
    end

    add_reference :pet_owners, :user
    add_reference :sitters, :user
  end
end
