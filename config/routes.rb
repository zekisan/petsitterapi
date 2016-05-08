Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :sitters do
        member do
          get 'contacts'
          post 'insert_profile_photo'
        end
      end

      resources :pet_owners do
        member do
          get 'contacts'
          post 'search_sitters'
          post 'request_contact'
          post 'rate_contact'
          post 'insert_photo'
          post 'insert_profile_photo'
        end
      end

      resources :contacts do
        member do
          post 'update_status'
        end
      end

      resources :rates do
        member do
          post 'reply_rate'
        end
      end

      resources :users do
        member do
          post 'insert_photo'
          post 'update_device_token'
          post 'logout'
        end
      end

      post 'login', to: 'users#login'
    end
  end
end
