class CreatePetsitter < ActiveRecord::Migration
  def change
    create_table :sitters do |t|
      t.string :name
      t.string :address
    end unless reverting?
  end
end
