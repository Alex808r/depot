Rails.application.routes.draw do
  resources :orders
  root 'store#index', as: 'store_index' # устанавливаем корневой маршрут. as :'store_index' добавит методы
                                                   # store_index_path and store_index_url

  resources :line_items
  resources :carts
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
