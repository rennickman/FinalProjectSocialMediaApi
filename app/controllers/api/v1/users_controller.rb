class Api::V1::UsersController < ApiController
    # before_action :doorkeeper_authorize!
    before_action :set_user, only: %i[ show edit update destroy info follow unfollow]
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
        render json: @user, methods: [:image_url]
    end


    
    # GET /me.json
    # Return information about the Current User
    def me
        if @current_user.nil?
            # Send error Message if Current User not found
            render json: { error: 'Not Authorized' }, status: :unauthorized
        else
            # Return  current User
            render json: @current_user, methods: [:image_url, :followers, :followings]
        end
    end



    def follow
        @follow = Follow.new()
        @follow.follower_id = @current_user.id
        @follow.followed_user_id = @user.id
        
        if @follow.save
            render json: @follow,  status: :created
        else
            render json: @follow.errors, status: :unprocessable_entity
        end
    end


    def unfollow
        @follow = Follow.find_by(follower_id: @current_user.id, followed_user_id: @user.id)

        @follow.destroy
        render json: {}, status: :ok
    end


    private 


    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end
end