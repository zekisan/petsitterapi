# == Schema Information
#
# Table name: pet_owners
#
#  id        :integer          not null, primary key
#  name      :string
#  address   :string
#  district  :string
#  latitude  :decimal(18, 16)
#  longitude :decimal(18, 16)
#  photo_id  :integer
#  app_id    :string
#  surname   :string
#

require 'rails_helper'

RSpec.describe PetOwner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
