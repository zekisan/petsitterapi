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