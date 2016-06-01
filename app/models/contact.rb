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
    User.where(entity_type: 'Sitter', entity_id: self.sitter.app_id).first
  end

  def contact_json
    {app_id: self.app_id, date_start: self.date_start, date_final: self.date_final,
     time_start: self.time_start, time_final: self.time_final, created_at: self.created_at,
     status_cd: self.status_cd, total_value: self.total_value, owner: self.pet_owner.owner_json,
     sitter: self.sitter.sitter_json, pets: self.pets.map(&:pet_json),
     rate: self.rate.present? ? {app_id: self.rate.app_id, stars_qtd: self.rate.stars_qtd,
                                 owner_comment: self.rate.pet_owner_comment,
                                 sitter_comment: self.rate.sitter_comment} : nil,
     summaries: self.summaries.map(&:summary_json)}
  end

  def self.create_contacts_for_sitter(sitter)
    Contact.create(sitter_id: sitter.id,
                    pet_owner_id: PetOwner.find_by_app_id("808d293a-f93e-42a7-af07-1584eb0f22e8").id,
                   app_id: SecureRandom.hex(13),
                   date_start: '2016-07-01',
                   date_final: '2016-07-04',
                   time_start: '14h00',
                   time_final: '16h00',
                   status_cd: 10,
                   total_value: 200,
                   contact_pets_attributes: [{pet_id: PetOwner.find_by_app_id("808d293a-f93e-42a7-af07-1584eb0f22e8").pets.first.id}])
    Contact.create(sitter_id: sitter.id,
                   pet_owner_id: PetOwner.find_by_app_id("256bd470-816d-4688-830b-732d0b1881e7").id,
                   app_id: SecureRandom.hex(13),
                   date_start: '2016-05-31',
                   date_final: '2016-05-10',
                   time_start: '14h00',
                   time_final: '16h00',
                   status_cd: 30,
                   total_value: 200,
                   contact_pets_attributes: [{pet_id: PetOwner.find_by_app_id("808d293a-f93e-42a7-af07-1584eb0f22e8").pets.first.id}])
    Contact.create(sitter_id: sitter.id,
                   pet_owner_id: PetOwner.find_by_app_id("ad8c40c7-3343-451a-8833-aa2fec8ce26b").id,
                   app_id: SecureRandom.hex(13),
                   date_start: '2016-05-01',
                   date_final: '2016-05-04',
                   time_start: '14h00',
                   time_final: '16h00',
                   status_cd: 40,
                   total_value: 200,
                   contact_pets_attributes: [{pet_id: PetOwner.find_by_app_id("808d293a-f93e-42a7-af07-1584eb0f22e8").pets.first.id}])
  end

  def self.create_contacts_for_owner(owner)
    Contact.create(sitter_id: Sitter.find_by_app_id("3c4922e3-6837-40b0-a7fc-7dbda9e9a52a").id,
                   pet_owner_id: owner.id,
                   app_id: SecureRandom.hex(13),
                   date_start: '2016-07-01',
                   date_final: '2016-07-04',
                   time_start: '14h00',
                   time_final: '16h00',
                   status_cd: 10,
                   total_value: 200,
                   contact_pets_attributes: [{ pet_id: owner.pets.first.id}])
    Contact.create(sitter_id: Sitter.find_by_app_id("3c4922e3-6837-40b0-a7fc-7dbda9e9a52a").id,
                   pet_owner_id: owner.id,
                   app_id: SecureRandom.hex(13),
                   date_start: '2016-05-31',
                   date_final: '2016-05-10',
                   time_start: '14h00',
                   time_final: '16h00',
                   status_cd: 30,
                   total_value: 200,
                   contact_pets_attributes: [{ pet_id: owner.pets.first.id}])
    Contact.create(sitter_id: Sitter.find_by_app_id("3c4922e3-6837-40b0-a7fc-7dbda9e9a52a").id,
                   pet_owner_id: owner.id,
                   app_id: SecureRandom.hex(13),
                   date_start: '2016-05-01',
                   date_final: '2016-05-04',
                   time_start: '14h00',
                   time_final: '16h00',
                   status_cd: 40,
                   total_value: 200,
                   contact_pets_attributes: [{ pet_id: owner.pets.first.id}])
  end
end
