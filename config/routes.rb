Rails.application.routes.draw do
  devise_for :users
  root "groups#index";

  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
