Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :desserts, :drinks, :cashiers, :waiters, :managers, :menu_items, :clients, :feedbacks
  resources :orders do
    member do
      put 'update_state'
    end
    resources :order_details
  end


  root to: "orders#new"
end
