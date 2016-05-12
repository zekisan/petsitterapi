class AddAppIdToRate < ActiveRecord::Migration
  def change
    add_column :rates, :app_id, :string
    add_column :rates, :pet_owner_comment, :string
    add_column :rates, :sitter_comment, :string

    drop_table :pet_owner_comments
    drop_table :sitter_comments
  end
end
