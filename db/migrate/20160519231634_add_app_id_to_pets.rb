class AddAppIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :app_id, :string
  end
end
