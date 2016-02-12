Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :sitters do
        collection do
          get 'search'
        end
      end
    end
  end
end
