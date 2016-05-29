# == Schema Information
#
# Table name: summaries
#
#  id         :integer          not null, primary key
#  app_id     :string
#  text       :string
#  created_at :string
#  contact_id :integer
#  photo_id   :integer
#

class Summary < ActiveRecord::Base

  belongs_to :contact
  belongs_to :photo

  def summary_json
    { app_id: self.app_id, text: self.text, created_at: self.created_at,
      photo: { app_id: self.photo.app_id, image: self.photo.image.url } }
  end

end
