class AddAppidToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :app_id, :integer
  end
end