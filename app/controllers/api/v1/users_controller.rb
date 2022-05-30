class Api::V1::UsersController < ApiController
    # before_action :doorkeeper_authorize!
    # Call method to get Current User from Access Token
    before_action :current_user
    respond_to    :json



    
    # GET /users or /users.json
    def index
        @users = User.all

        # Render all Users in JSON
        render json: @users
    end

    
    # GET /me.json
    # Return information about the Current User
    def me
        if @current_user.nil?
            # Send error Message if Current User not found
            render json: { error: 'Not Authorized' }, status: :unauthorized
        else
            # Return Information about current User
            render json: {
                id: @current_user.id,
                email: @current_user.email,
                role: @current_user.role,
                firstname: @current_user.firstname,
                surname: @current_user.surname,
                created_at: @current_user.created_at.to_time.to_i
            }, status: :ok
        end
    end
end