Rails.application.routes.draw do
  resources :cities
  resources :countries
  devise_for :users, controllers: { confirmations: 'confirmations',
                                    registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do

    match 'users/:id', to: 'info#index', as: :info, via: [:get]
    match 'users/:id', to: 'info#update', as: :info_update, via: [:patch]


    namespace :admin do
      get '/', to: 'home#index', as: :home
    end

    namespace :employee do
      get '/', to: 'home#index', as: :home
    end
  end

  root to: redirect('/users/sign_in')
end
