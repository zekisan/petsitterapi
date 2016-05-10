class AddStartsQtdToContacts < ActiveRecord::Migration
  def change
    remove_column :rates, :positive

    add_column :rates, :stars_qtd, :integer
  end
end
