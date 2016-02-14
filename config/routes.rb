Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :sitters

      resources :pet_owners do
        member do
          get 'search_sitters'
        end
      end
    end
  end
end
