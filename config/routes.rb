Rails.application.routes.draw do
  default_url_options host: 'localhost'
  devise_for :users

  root 'posts#index'
  get '/show/:id' => 'profiles#show', as: 'profile'
  get '/moderator/:id' => 'profiles#moderator', as: 'moderator'
  get '/del_moderator/:id' => 'profiles#del_moderator', as: 'del_moderator'
  get '/ban/:id' => 'profiles#ban', as: 'ban'
  get '/unban/:id' => 'profiles#unban', as: 'unban'
  get '/index/:id' => 'table_mmr#index', as: 'table_mmr'

  resources :posts do
    resources :likes
    resources :comments
  end
end
