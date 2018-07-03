Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    # get 'interests', on: :member
  end
  resources :posts do
  	get 'post_by_following_users', on: :collection
  end
  resources :comments
  resources :categories, only: [:create, :destroy]
end