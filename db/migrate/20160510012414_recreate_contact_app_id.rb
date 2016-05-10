class RecreateContactAppId < ActiveRecord::Migration
  def change
    remove_column :contacts, :app_id

    add_column :contacts, :app_id, :string
  end
end
