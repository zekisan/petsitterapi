class AddPhoneToPetOwner < ActiveRecord::Migration
  def change
    add_column :pet_owners, :phone, :string
  end
end
