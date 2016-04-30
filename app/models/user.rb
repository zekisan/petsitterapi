# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  password     :string
#  entity_type  :string
#  entity_id    :integer
#  device_token :string
#  photo_id     :integer
#

class User < ActiveRecord::Base

  belongs_to :photo

end
