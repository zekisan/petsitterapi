class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.boolean :positive
      t.references :contact
    end

    create_table :sitter_comments do |t|
      t.string :text
      t.references :rate
    end

    create_table :pet_owner_comments do |t|
      t.string :text
      t.references :rate
    end
  end
end
