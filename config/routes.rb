Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  resources :articles
  resources :teams do
    resources :team_infos
    resources :team_pictures
    resources :event_teams
  end
  resources :rules
  
  resources :race_schedules do
    resources :event_teams
  end
  
  resources :sponsors
  resources :standings
  
  resources :topics
 
  resources :sessions, only: [:new]
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
