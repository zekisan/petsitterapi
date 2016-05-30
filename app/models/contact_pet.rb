class ContactPet < ActiveRecord::Base

  belongs_to :contact
  belongs_to :pet

end