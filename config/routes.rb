Rails.application.routes.draw do

  root to:"home#home"

  resources :users

  resources :sections

  resources :grades


  resources :grades do
    resources :candidates
  end

  resources :fees

  resource :payment
  resources :notices
  resources :eligibilities

  get 'all',to: "payments#all"
  get 'appointment',to:"candidates#appointment"
  get 'achievements' , to: "welcome#achievements"
  get 'contact' , to: "welcome#contact"
  get '/information' , to: "welcome#information"
  get '/fee', to:'welcome#fee'
  get    '/welcome',  to: 'welcome#welcome'

  get    '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
