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
#  app_id       :string
#

require 'gcm'

class Contact < ActiveRecord::Base

  belongs_to :pet_owner
  belongs_to :sitter

  has_many :contact_pets
  has_many :pets, through: :contact_pets
  has_many :summaries

  has_one :rate

  accepts_nested_attributes_for :contact_pets

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
    options = {data: {message: 'Solicitação de Trabalho', title: 'Título da Notification',
                      body: self.contact_json, icon: 'ic_launcher'}, collapse_key: "updated_score"}
    response = gcm.send([user.device_token], options)
    Rails.logger.debug response.inspect
  end

  def get_owner_user
    User.where(entity_type: 'Sitter', entity_id: self.sitter.id).first
  end

  def contact_json
    {app_id: self.app_id, date_start: self.date_start, date_final: self.date_final,
     time_start: self.time_start, time_final: self.time_final, created_at: self.created_at,
     status_cd: self.status_cd, total_value: self.total_value, owner: self.pet_owner.owner_json,
     sitter: self.sitter.sitter_json, animals: self.animals.map { |a| {id: a.id, name: a.name} },
     rate: self.rate.present? ? {app_id: self.rate.app_id, stars_qtd: self.rate.stars_qtd,
                                 owner_comment: self.rate.pet_owner_comment,
                                 sitter_comment: self.rate.sitter_comment} : nil,
     summaries: self.summaries.map(&:summary_json)}
  end
end
