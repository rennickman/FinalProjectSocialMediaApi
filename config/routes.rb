Rails.application.routes.draw do
     # Defines the root path route ("/")
    root "pages#home"

    # use_doorkeeper

    # Devise User Routes
    devise_for :users

    # Add additional Routes for Api
    # draw :api

    resources :posts
end
