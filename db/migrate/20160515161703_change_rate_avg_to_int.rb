class ChangeRateAvgToInt < ActiveRecord::Migration
  def change
    change_column :sitters, :rate_avg, :integer
  end
end
