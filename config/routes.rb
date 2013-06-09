VenueCritic::Application.routes.draw do

  resources :venues do
    resources :reviews
  end

  resources :reviews

  devise_for :users, controller: { registrations: "users/registrations",
                                   passwords: "users/passwords" }

  root to: "venues#index"
end
