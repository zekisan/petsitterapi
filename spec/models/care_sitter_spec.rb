# == Schema Information
#
# Table name: care_sitters
#
#  id         :integer          not null, primary key
#  care_id    :integer
#  sitter_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CareSitter, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
