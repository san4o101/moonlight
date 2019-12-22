Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations',
                                    registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do

    match 'users/:id', to: 'info#index', as: :info, via: [:get]
    match 'users/:id', to: 'info#update', as: :info_update, via: [:patch]
    post '/autocomplete_city', to: 'autocomplete#autocomplete_city', as: :autocomplete_city


    namespace :admin do
      get '/', to: 'home#index', as: :home

      resources :users, except: %i[new create]
      get '/users/:id/password', to: 'users#password', as: :user_password
      patch '/users/:id/password', to: 'users#password_change',
                                   as: :user_change_password

      namespace :settings do
        resources :cities
        resources :countries
      end
    end

    namespace :employee do
      get '/', to: 'home#index', as: :home
      resources :bills, only: %i[index new create destroy]
    end
  end

  root to: redirect('/users/sign_in')
end
