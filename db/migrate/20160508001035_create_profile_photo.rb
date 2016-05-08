class CreateProfilePhoto < ActiveRecord::Migration
  def change
    create_table :sitter_profile_photos do |t|
      t.string :image
      t.references :sitter
    end

    create_table :pet_owner_profile_photos do |t|
      t.string :image
      t.references :pet_owner
    end
  end
end
