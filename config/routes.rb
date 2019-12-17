Rails.application.routes.draw do
  resources :bills
  devise_for :users, controllers: { confirmations: 'confirmations',
                                    registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do

    match 'users/:id', to: 'info#index', as: :info, via: [:get]
    match 'users/:id', to: 'info#update', as: :info_update, via: [:patch]
    post '/autocomplete_city', to: 'autocomplete#autocomplete_city', as: :autocomplete_city


    namespace :admin do
      get '/', to: 'home#index', as: :home
      namespace :settings do
        resources :cities
        resources :countries
        resources :users, except: %i[new create]
      end
    end

    namespace :employee do
      get '/', to: 'home#index', as: :home
    end
  end

  root to: redirect('/users/sign_in')
end
