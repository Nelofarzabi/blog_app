Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # root 'users#index'
  # get '/users/:id', to: 'users#show'
  # get 'users/:id/posts', to: 'posts#index'
  # get 'users/:id/posts/:post_id', to: 'posts#show'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[new create index show] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end
