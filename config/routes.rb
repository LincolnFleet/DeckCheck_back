Rails.application.routes.draw do
  get 'decks/index'
  get 'decks/show'
  get 'decks/create'
  get 'decks/update'
  get 'decks/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/update'
  get 'users/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
