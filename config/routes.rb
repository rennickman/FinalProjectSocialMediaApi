Rails.application.routes.draw do
     # Defines the root path route ("/")
    root "pages#home"

    # Add Doorkeeper
    use_doorkeeper

    # Devise User Routes
    devise_for :users

    # Add additional Routes for Api
    draw :api

    resources :posts

    # Test route for image upload
    get 'latest', to: 'posts#latest'
end
