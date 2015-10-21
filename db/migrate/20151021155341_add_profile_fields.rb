class AddProfileFields < ActiveRecord::Migration
  def change
    add_column :sitters, :district, :string
    add_column :sitters, :value_hour, :decimal, precision: 5, scale: 2
    add_column :sitters, :value_shift, :decimal, precision: 5, scale: 2
    add_column :sitters, :value_day, :decimal, precision: 5, scale: 2
    add_column :sitters, :about_me, :text
  end
end
