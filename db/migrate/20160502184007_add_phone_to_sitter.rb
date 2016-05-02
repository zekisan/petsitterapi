class AddPhoneToSitter < ActiveRecord::Migration
  def change
    add_column :sitters, :phone, :string
  end
end
