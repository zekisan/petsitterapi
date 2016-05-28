class AddAgeTextToPet < ActiveRecord::Migration
  def change
    add_column :pets, :age_text, :string
  end
end
