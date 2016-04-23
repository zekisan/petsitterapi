# == Schema Information
#
# Table name: sitters
#
#  id                :integer          not null, primary key
#  name              :string
#  address           :string
#  latitude          :decimal(18, 16)
#  longitude         :decimal(18, 16)
#  photo             :string
#  header_background :string
#  district          :string
#  value_hour        :decimal(5, 2)
#  value_shift       :decimal(5, 2)
#  value_day         :decimal(5, 2)
#  about_me          :text
#  user_id           :integer
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
