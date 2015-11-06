require 'rails_helper'

RSpec.describe Sitter, type: :model do

  it 'first_test' do
    expect(Sitter.all.count).to eq 4
  end

end