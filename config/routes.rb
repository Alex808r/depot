Rails.application.routes.draw do

  get 'admin' => 'admin#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy


  end
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :orders
  root 'store#index', as: 'store_index' # устанавливаем корневой маршрут. as :'store_index' добавит методы
                                                   # store_index_path and store_index_url

  resources :line_items
  resources :carts
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products do
    get :who_bought, on: :member
    end

end
