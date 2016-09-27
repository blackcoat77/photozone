Rails.application.routes.draw do

    # Route for admin ( from rails_admin gem )
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    root 'posts#index'

    resources :dashboard, only: [:index]

    # route for categories
    resources :categories


    # Add nested route for comments
    resources :posts do
        resources :comments

        # acts as votable route
        member do
          put 'like', to: 'posts#upvote'
        end
    end

    devise_for :users

end
