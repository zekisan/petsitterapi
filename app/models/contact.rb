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

require 'gcm'

class Contact < ActiveRecord::Base

  belongs_to :pet_owner
  belongs_to :sitter

  has_many :animal_contacts
  has_many :animals, through: :animal_contacts

  has_one :rate

  accepts_nested_attributes_for :animal_contacts

  after_create :send_notification_to_sitter

  as_enum :status, new: 10, rejected: 20, accepted: 30, finished: 40, late: 50

  def self.update_status
    Contact.all.each do |c|
      c.update(status: 40) if c.date_final.to_datetime < DateTime.now && c.status_cd == 30
      c.update(status: 50) if c.date_start.to_datetime < DateTime.now && c.status_cd == 10
    end
  end

  def send_notification_to_sitter
    user = get_owner_user
    gcm = GCM.new(ENV['GCM_API_KEY'])
    notification = { title: 'Título da Notification', body: 'Body da Notification', icon: 'ic_launcher' }
    options = {data: {message: 'Solicitação de Trabalho'}, collapse_key: "updated_score", notification: notification}
    gcm.send(user.device_token, options)
  end

  def get_owner_user
    User.where(entity_type: 'Sitter', entity_id: self.owner.id).first
  end
end
