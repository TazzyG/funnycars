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
  
  resources :event_teams
  
  resources :news_feeds
  
  get '/photos2010', to: 'archives#photos_2010'
  get '/photos2011', to: 'archives#photos_2011'
  get '/photos2012', to: 'archives#photos_2012'
  get '/photos2013', to: 'archives#photos_2013'
  get '/photos2014', to: 'archives#photos_2014'
  get '/photos2015', to: 'archives#photos_2015'
  get '/photos2016', to: 'archives#photos_2016'
  
  resources :sponsors
  resources :standings
  
  resources :topics
 
  resources :sessions, only: [:new]
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
