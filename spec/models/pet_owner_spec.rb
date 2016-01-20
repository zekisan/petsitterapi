require 'rails_helper'

RSpec.describe PetOwner, type: :model do

  let(:owner1) { PetOwner.first }

  it 'Should return near sitters' do
    expect(owner1.search_near_sitters.count).to eq 4
  end

end
