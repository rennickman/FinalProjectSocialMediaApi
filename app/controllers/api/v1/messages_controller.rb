class Api::V1::MessagesController < ApiController
    before_action :set_message, only: %i[ show edit update destroy ]
    before_action :set_conversation
    # Call method to get Current User from Access Token
    before_action :current_user


    def create
        @message = @conversation.messages.create(message_params)
        @message.user = @current_user

        if @message.save
            render json: @message,  status: :created
        else
            render json: @message.errors, status: :unprocessable_entity
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
    def set_message
        @message = Message.find(params[:id])
    end


    def set_conversation
        @conversation = Conversation.find(params[:conversation_id])
    end


    # Only allow a list of trusted parameters through.
    def message_params
        params.require(:message).permit(:text)
    end

end