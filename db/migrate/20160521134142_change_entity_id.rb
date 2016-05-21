class ChangeEntityId < ActiveRecord::Migration
  def change
    change_column :users, :entity_id, :string
  end
end
