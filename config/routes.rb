Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [] do # without [] it would make all the 7 crud routes for the channels, here we want channels/channel:id/messages
        resources :messages, only: [ :index, :create ]
      end
    end
  end

  resources :channels, only: [ :show ]
  root to: 'channels#show'
end
