class AddAddressFields < ActiveRecord::Migration
  def change

    add_column :sitters, :street, :string
    add_column :sitters, :address_number, :string
    add_column :sitters, :complement, :string
    add_column :sitters, :cep, :string
    add_column :sitters, :city, :string
    add_column :sitters, :state, :string

    add_column :pet_owners, :street, :string
    add_column :pet_owners, :address_number, :string
    add_column :pet_owners, :complement, :string
    add_column :pet_owners, :cep, :string
    add_column :pet_owners, :city, :string
    add_column :pet_owners, :state, :string

    remove_column :sitters, :address
    remove_column :pet_owners, :address

  end
end
