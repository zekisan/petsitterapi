Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :sitters

      resources :pet_owners do
        member do
          post 'search_sitters'
          post 'request_contact'
        end
      end
    end
  end
end
