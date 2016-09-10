Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :desserts, :drinks, :cashiers, :waiters, :managers, :menu_items
  resources :clients do
    resources :feedbacks
  end
  resources :orders do
    resources :order_details
  end
end
