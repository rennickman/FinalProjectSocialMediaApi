class Api::V1::PostLikesController < ApiController
    before_action :set_post_like, only: %i[ show edit update destroy ]
    before_action :set_post
    # Call method to get Current User from Access Token
    before_action :current_user


    def create
        @post_like = @post.post_likes.create()
        @post_like.user = @current_user

        if @post_like.save
            render json: @post_like,  status: :created
        else
            render json: @post_like.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @post_like.destroy

        render json: {}, status: :ok
    end





    private

    
    # Use callbacks to share common setup or constraints between actions.
    def set_post_like
        @post_like = PostLike.find(params[:id])
    end


    def set_post
        @post = Post.find(params[:post_id])
    end
end