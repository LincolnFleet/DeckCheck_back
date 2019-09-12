Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  delete '/decks', to: 'decks#destroy', as: 'delete'
  resources :users, only: [:index, :show, :create, :update, :delete]
  resources :decks, only: [:index, :show, :create, :update, :delete]
  resources :cards, only: [:index, :show, :create, :update, :delete]
  post '/login', to: 'sessions#create_session', as: 'login'
  post '/search', to: 'searches#cards', as: 'search'
  post '/submitDeck', to: 'cards#intakeList', as: 'intakeList'
end