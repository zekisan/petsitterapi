class Contact < ActiveRecord::Base

  belongs_to :pet_owner
  belongs_to :sitter

end