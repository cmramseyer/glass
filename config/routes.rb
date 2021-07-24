Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :orders
      resources :stages
    end
  end

  devise_for :users
  root "orders#index"
  resources :polish_types
  resources :activities, only: [:index]
  resources :stages
  resources :programs
  resources :cuts
  resources :work_logs
  resources :reports, only: [:new, :index]
  resources :trackings do
    resources :perform_work, only: [:create]
  end
  resources :stats
  resources :mat_view_stats
  resources :product_lines do
    resources :zebra_default_label, only: [:index]
    resources :zebra_alternative_label, only: [:index]

  end
  resources :products
  resources :orders do
    resources :order_report, only: [:index]
    resources :invoice_report, only: [:index]
    resources :stages
    resources :activation, only: [:create]
    resources :zebra_package_label, only: [:index]
    resources :zebra_fragile_package_label, only: [:index]
    collection do
      resources :last_orders_report, only: [:index]
    end
  end
  
end
