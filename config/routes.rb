Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#home"
    get "static_pages/home"
    get "static_pages/help"
    get "static_pages/about"
    get "static_pages/contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :account_activations, only: :edit
    resources :password_resets, only: %i(new create edit update)
    resources :microposts, only: %i(create destroy)
    resources :relationships, only: %i(create destroy)
  end
end
