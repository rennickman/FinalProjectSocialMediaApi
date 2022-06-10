class Api::V1::UsersController < ApiController
    # before_action :doorkeeper_authorize!
    before_action :set_user, only: %i[ show edit update destroy info]
    # Call method to get Current User from Access Token
    before_action :current_user
    respond_to    :json

    

    
    # GET /users or /users.json
    def index
        @users = User.all

        # Render all Users in JSON
        render json: @users, methods: [:image_url]
    end


    # GET /users/1 or /users/1.json
    def show
        # Get posts for user
        @posts = @user.posts.order(created_at: :desc)

        # Render Post and comments in JSON
        render json:  @posts, include: [:user, :comments, :post_likes]
    end


    def info 
        render json: @user
    end


    
    # GET /me.json
    # Return information about the Current User
    def me

        if @current_user.nil?
            # Send error Message if Current User not found
            render json: { error: 'Not Authorized' }, status: :unauthorized
        else
            
            # Get all posts sent by Current User
            @posts = Post.where(user_id: @current_user.id)

            # Return Information about current User
            render json: {
                id: @current_user.id,
                email: @current_user.email,
                role: @current_user.role,
                firstname: @current_user.firstname,
                surname: @current_user.surname,
                created_at: @current_user.created_at.to_time.to_i,
                posts: @posts
            }, status: :ok
        end
    end




    private 


    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end
end