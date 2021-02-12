Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :bottle_deposit do
    resources :configurations, except: [:show]
    resources :storages, except: [:show]
  end
end
