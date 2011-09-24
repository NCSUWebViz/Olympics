OlympicGames::Application.routes.draw do
  resources :games, :only => [:index, :show]
  resources :countries, :only => [:show]

  root :to => 'games#index'
end
