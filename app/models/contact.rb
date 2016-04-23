# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  sitter_id    :integer
#  pet_owner_id :integer
#  date_start   :string
#  date_final   :string
#  time_start   :string
#  time_final   :string
#  created_at   :datetime
#  updated_at   :datetime
#  total_value  :decimal(7, 2)
#  status_cd    :integer          default(10)
#  app_id       :integer
#

class Contact < ActiveRecord::Base

  belongs_to :pet_owner
  belongs_to :sitter

  has_many :animal_contacts
  has_many :animals, through: :animal_contacts

  has_one :rate

  accepts_nested_attributes_for :animal_contacts

  as_enum :status, new: 10, rejected: 20, accepted: 30, finished: 40, late: 50

  def self.update_status
    Contact.all.each do |c|
      c.update(status: 50) if c.date_start.to_datetime < DateTime.now && c.status_cd == 10
    end
  end

end
