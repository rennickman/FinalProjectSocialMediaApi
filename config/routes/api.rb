# Api Routes
namespace :api do
    namespace :v1 do
        scope :users, module: :users do
            # User Registration Route
            post '/', to: 'registrations#create', as: :user_registration
        end

        # Routes for Posts, Comments
        resources :posts do
            resources :comments
            resources :post_likes
        end

        resources :conversations do
            resources :messages
        end

        resources :notifications 


        # User Routes
        get '/users/me', to: 'users#me'
        get '/users/followings', to: 'users#followings'
        get '/users/:id/info', to: 'users#info'
        get '/users/conversations', to: 'users#conversations'
        post '/users/:id/follow', to: 'users#follow'
        delete '/users/:id/unfollow', to: 'users#unfollow'
        put 'users/updateInfo', to: 'users#updateInfo'
        get 'users/randomPost', to: 'users#randomPost'
        get '/conversations/check/:name', to: 'conversations#check'

       
        resources :users, only: [:index, :show]
    end
end



# Scope for Api
scope :api do
    scope :v1 do
        use_doorkeeper do
            skip_controllers :authorizations, :applications, :authorized_applications
        end
    end
end