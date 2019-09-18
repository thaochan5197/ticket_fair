Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :static_pages, only: :index
    root "static_pages#index"
    resources :garages
    resources :customers
    resources :tickets
    devise_for :user_admins, controllers: { registrations: "registrations" }
    namespace :admin do
      resources :garages
      resources :static_pages, only: %i(index)
    end
    devise_scope :user_admins do
      authenticated do
        root to: "admin/static_pages#index", as: :authenticated_root
      end
      unauthenticated do
        root to: "devise/session#new", as: :unauthenticated_root
      end
    end
  end
end
