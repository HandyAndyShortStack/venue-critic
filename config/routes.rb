VenueCritic::Application.routes.draw do

  resources :venues do
    resources :reviews
  end

  resources :reviews

  root to: "venues#index"
end
