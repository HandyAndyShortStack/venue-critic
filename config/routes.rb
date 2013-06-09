VenueCritic::Application.routes.draw do

  resources :venues

  root to: "venues#index"
end
