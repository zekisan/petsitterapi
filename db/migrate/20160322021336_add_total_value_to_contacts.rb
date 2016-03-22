class AddTotalValueToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :total_value, :decimal, precision: 5, scale: 2
  end
end
