Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions'
  get '/privacy', to: 'pages#privacy'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
