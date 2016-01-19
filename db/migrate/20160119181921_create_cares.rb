class CreateCares < ActiveRecord::Migration
  def change
    create_table :cares do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
