Rails.application.routes.draw do
  # Topページ
  root to: 'tops#index'

  # ログインページ
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # ユーザー登録
  resources :users, only: [:new, :create, :show, :edit, :destroy]
end
