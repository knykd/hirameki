Rails.application.routes.draw do
  root to: 'tops#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :password_resets, only: %i[new create edit update]

  resources :users, only: %i[new create]
  resources :words, only: %i[index]
  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
