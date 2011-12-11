OlympicGames::Application.routes.draw do
  resources :games, :only => [:index, :show]
  resources :countries, :only => [:index, :show]
  resources :medals, :only => [:index]
  resources :sports, :only => [:index, :show]
  
  resources :participations, only: [:index, :show]

  root :to => 'games#index'
end
