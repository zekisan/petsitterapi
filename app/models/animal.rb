# == Schema Information
#
# Table name: animals
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Animal < ActiveRecord::Base

  has_many :animal_sitters
  has_many :sitters, through: :animal_sitters

  has_many :animal_contacts
  has_many :contacts, through: :animal_contacts

  def animal_json
    { id: self.id, name: self.name }
  end

end
