Rails.application.routes.draw do
    devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'homes#top'
  get 'homes/about'

  resources :users

  resources :posts, except: [:create]
  post '/posts/new' => "posts#create", as: :post_create

  #ゲストユーザーのサインインページ
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  devise_scope :user do
    post 'user/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
