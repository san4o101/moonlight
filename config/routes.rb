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

      resources :users, except: %i[new create] do
        get '/password', to: 'users#password', as: :password
        patch '/password', to: 'users#password_change',
                           as: :change_password
      end

      namespace :settings do
        resources :cities
        resources :countries
      end
    end

    namespace :employee do
      get '/', to: 'home#index', as: :home
      resources :bills, only: %i[index show new create destroy] do
        get 'replenishment', to: 'bills#replenishment',
                             as: :bill_replenishment
        patch '/replenishment', to: 'bills#replenishment_update'
      end
    end
  end

  root to: redirect('/users/sign_in')
end
