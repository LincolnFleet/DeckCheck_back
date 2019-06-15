Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :decks, only: [:index, :show, :create, :update, :destroy]
  resources :cards, only: [:index, :show, :create, :update, :destory]
  post '/login', to: 'sessions#create_session', as: 'login'
  post '/search', to: 'searches#cards', as: 'search'
end