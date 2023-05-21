Rails.application.routes.draw do
  namespace :welcome do
    get 'revenues/index'
  end
  namespace :user_system do
    get 'perfil/index'
    get 'welcome/index'
    resources :perfil, only: [:index, :edit, :update]
    resources :revenues, only: [:index, :edit, :update]
  end
  namespace :admin_system do
    get 'welcome/index'
  end
  devise_for :admins
  devise_for :users
  root to:'welcome#index'
end
