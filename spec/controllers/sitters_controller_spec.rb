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

RSpec.describe SittersController, type: :controller do

  describe 'GET #index' do
    context 'generic search' do

      before do
        get :index
      end

      it 'Should return json' do
        expect(response.content_type).to eq 'application/json'
      end

      it 'Should return all sitters' do
        content = JSON.parse(response.body)
        expect(content.count).to eq 4
      end

    end
  end

end
