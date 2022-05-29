# Api Routes
namespace :api do
    namespace :v1 do
        scope :users, module: :users do
            # User Registration Route
            post '/', to: 'registrations#create', as: :user_registration
        end

        resources :posts
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