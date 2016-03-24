class AddStatusToContact < ActiveRecord::Migration
  def change

    add_column :contacts, :status_cd, :integer, default: 10

    unless reverting?
      execute <<-SQL
        UPDATE contacts
        SET status_cd = 10
        WHERE id > 0
      SQL
    end

  end
end
