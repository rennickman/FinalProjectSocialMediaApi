class Api::V1::CommentsController < ApiController
    before_action :set_comment, only: %i[ show edit update destroy ]
    before_action :set_post
    # Call method to get Current User from Access Token
    before_action :current_user


    def create
        @comment = @post.comments.create(comment_params)
        @comment.user = @current_user

        if @comment.save
            render json: @comment,  status: :created
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @comment.destroy

        respond_to do |format|
            format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
            format.json { head :no_content }
        end
    end





    private

    
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
        @comment = Comment.find(params[:id])
    end


    def set_post
        @post = Post.find(params[:post_id])
    end


    # Only allow a list of trusted parameters through.
    def comment_params
        params.require(:comment).permit(:message)
    end

end