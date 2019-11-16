Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations',
                                    registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticated :user do
    root 'home#index', as: :authenticated_root

    namespace :admin do
      get '/', to: 'home#index', as: :home
    end

    namespace :employee do
      get '/', to: 'home#index', as: :home
    end
  end

  root to: redirect('/users/sign_in')
end
