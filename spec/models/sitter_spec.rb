# == Schema Information
#
# Table name: sitters
#
#  id             :integer          not null, primary key
#  name           :string
#  district       :string
#  about_me       :text
#  value_hour     :decimal(5, 2)
#  latitude       :decimal(18, 16)
#  longitude      :decimal(18, 16)
#  photo_id       :integer
#  phone          :string
#  rate_avg       :integer
#  app_id         :string
#  surname        :string
#  street         :string
#  address_number :string
#  complement     :string
#  cep            :string
#  city           :string
#  state          :string
#

require 'rails_helper'

RSpec.describe Sitter, type: :model do

  let(:animals) { Animal.create([{name: 'Cão'}, {name: 'Gato'}, {name: 'Tartaruga'}, {name: 'Peixe'},
                                 {name: 'Pássaro'}, {name: 'Coelho'}, {name: 'Hamster'},
                                 {name: 'Porquinho da Índia'}]) }

  let(:cares) { Care.create([{name: 'Passeio'}, {name: 'Corte de Unhas'}, {name: 'Aplica Medicação'},
                             {name: 'Massagem'}]) }
  let(:sitter1) { Sitter.create(name: 'Letícia', address: 'Rua General Lima e Silva, 500 - Centro Histórico, Porto Alegre - RS',
                                district: 'Centro Histórico', value_hour: 0.0, value_shift: 45.0, value_day: 150.0,
                                about_me: 'Lorem Ipsum.',
                                latitude: -30.0376441, longitude: -51.2222909, photo: 'sitter1', header_background: 'header_background_1',
                                animals: [animals[0], animals[1], animals[3]], cares: [cares[0], cares[1]]) }

  it 'Should be valid' do
    expect(sitter1).to be_valid
  end

end
