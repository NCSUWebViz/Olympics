OlympicGames::Application.routes.draw do
  resources :games, :only => [:index, :show]
  resources :countries, :only => [:show]
  resources :medals, :only => [:index]

  root :to => 'games#index'
end
