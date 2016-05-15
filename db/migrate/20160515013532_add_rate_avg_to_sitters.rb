class AddRateAvgToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :rate_avg, :decimal, precision: 2, scale: 1
  end
end
