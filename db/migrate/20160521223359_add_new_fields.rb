class AddNewFields < ActiveRecord::Migration
  def change
    add_column :sitters, :surname, :string
    add_column :pet_owners, :surname, :string
  end
end
