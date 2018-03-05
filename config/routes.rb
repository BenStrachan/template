Rails.application.routes.draw do
  root to: 'visitors#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations',
  }

  namespace :app do
    get 'dashboard' => 'dashboards#index',  as: :dashboards
    resources :users do
      collection do
        get :profile
      end
    end
  end

  namespace :admin do
    resources :users
  end
end
