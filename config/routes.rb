Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  resources :feeds do
    member do
      resources :items, only: [:index, :show]
    end
  end

  root 'feeds#index'
end
