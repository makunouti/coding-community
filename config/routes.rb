Rails.application.routes.draw do
  devise_for :users

  #ゲストログインのための記述
  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end

  root to: 'homes#top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'search_tag', to: 'questions#search_tag'

  resources :questions, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :bookmark, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy]
    collection do
      get 'search'
    end

  end
  resources :users, only: [:show, :edit, :update, :index] do
    member do
    get :bookmarks
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
