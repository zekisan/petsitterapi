class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :app_id
      t.string :text
      t.string :created_at

      t.references :contact
      t.references :photo
    end
  end
end
