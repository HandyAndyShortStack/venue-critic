VenueCritic::Application.routes.draw do

<<<<<<< HEAD
  resources :venues do
    resources :reviews
  end

  resources :reviews

  devise_for :users, controller: { registrations: "users/registrations",
=======
  devise_for :users, controllers: { registrations: "users/registrations",
>>>>>>> created users class, configured devise
                                   passwords: "users/passwords" }
  get "/awaiting_confirmation", to: "users#confirmation", as: "confirm_user"

  root to: "venues#index"

end
