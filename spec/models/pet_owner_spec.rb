# == Schema Information
#
# Table name: pet_owners
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :decimal(18, 16)
#  longitude  :decimal(18, 16)
#  district   :string
#  photo      :string
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe PetOwner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
