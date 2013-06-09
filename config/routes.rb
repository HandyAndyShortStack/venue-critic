VenueCritic::Application.routes.draw do

  devise_for :users, controller: { registrations: "users/registrations",
                                   passwords: "users/passwords" }

  resources :venues

  root to: "venues#index"
end
