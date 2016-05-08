class SitterProfilePhoto < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  belongs_to :sitter

end
