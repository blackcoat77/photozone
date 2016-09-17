Rails.application.routes.draw do
    # Route for admin ( from rails_admin gem )
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    root 'posts#index'

    resources :dashboard, only: [:index]

    # Add nested route for comments
    resources :posts do
        resources :comments
    end

    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    #
    #
end
