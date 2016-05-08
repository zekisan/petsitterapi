class PetOwnerProfilePhoto < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :pet_owner

end
