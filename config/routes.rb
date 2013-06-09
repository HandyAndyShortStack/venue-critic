VenueCritic::Application.routes.draw do

  resources :venues do
    resources :reviews
  end

  devise_for :users, controllers: { registrations: "users/registrations",
                                   passwords: "users/passwords" }

  get "/awaiting_confirmation", to: "users#confirmation", as: "confirm_user"

  root to: "venues#index"

end
