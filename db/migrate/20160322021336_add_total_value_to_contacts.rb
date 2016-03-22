class AddTotalValueToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :total_value, :decimal, precision: 2, scale: 4
  end
end
