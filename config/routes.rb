Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      get 'sitter_contacts', to: 'sitters#contacts'
      get 'pet_owner_contacts', to: 'pet_owners#contacts'

      resources :sitters do
        collection do
          post 'insert_profile_photo'
        end
      end

      resources :pet_owners do
        collection do
          post 'search_sitters'
          post 'request_contact'
          post 'rate_contact'
          post 'insert_photo'
          post 'insert_profile_photo'
        end
      end

      resources :contacts do
        collection do
          post 'update_status'
        end
      end

      resources :rates do
        collection do
          post 'reply_rate'
        end
      end

      resources :users do
        collection do
          post 'insert_photo'
          post 'update_device_token'
          post 'logout'
        end
      end

      post 'login', to: 'users#login'
    end
  end
end
