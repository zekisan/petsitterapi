class AddAppIdToModels < ActiveRecord::Migration
  def change
    add_column :pet_cares, :app_id, :string
    add_column :pet_owners, :app_id, :string
    add_column :pet_owner_profile_photos, :app_id, :string
    add_column :photos, :app_id, :string
    add_column :sitters, :app_id, :string
    add_column :sitter_profile_photos, :app_id, :string
    add_column :users, :app_id, :string
  end
end
