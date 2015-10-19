class AddImageFieldsToSitter < ActiveRecord::Migration
  def change
    add_column :sitters, :photo, :string
    add_column :sitters, :header_background, :string
  end
end
