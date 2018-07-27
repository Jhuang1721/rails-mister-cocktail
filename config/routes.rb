Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :create, :new, :destroy] do
    resources :doses, only: [:new, :create]  do
    end
  end
  resources :doses, only: [:destroy] do
  end

  root to: "cocktails#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
