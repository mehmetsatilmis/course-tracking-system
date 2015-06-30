Rails.application.routes.draw do
  resources :messages
  resources :videos
  resources :lessons
  resources :pivot_tbls
  resources :courses
  resources :messages
  resources :roles


  # get  'welcome/index'
  # post 'messages/create'
  # post 'messages/new'


  devise_for :users
  scope "/admin" do
    resources :users
  end


  authenticated :user do
    root :to => 'courses#index', as: :authenticated_root
  end
  root :to => 'welcome#index'
  #root to: 'messages#index'
end
