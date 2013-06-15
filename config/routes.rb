VenueCritic::Application.routes.draw do

  resources :authentications

  resources :venues do
    resources :reviews
  end

  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
                    controllers: { omniauth_callbacks: "authentications",
                                   registrations: "users/registrations",
                                   passwords: "users/passwords" }

  get "/awaiting_confirmation", to: "users#confirmation", as: "confirm_user"

  root to: "home#index"

end
