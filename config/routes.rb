Rails.application.routes.draw do
  resources :feeds do
    member do
      resources :items, only: [:index, :show]
    end
  end

  root 'feeds#index'
end
