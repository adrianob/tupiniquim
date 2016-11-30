Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order_details, :desserts, :drinks, :cashiers, :waiters, :managers, :menu_items, :clients, :feedbacks
  resources :orders do
    resources :order_details
  end
  resources :order_details do
    member do
      put 'update_state'
    end
  end

  root to: "order_details#index"
  match '/reports' => 'reports#show', :via => 'get'
end
