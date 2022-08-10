class Api::V1::ConversationsController < ApiController
    before_action :set_conversation, only: %i[ show edit update destroy ]
    # Call method to get Current User from Access Token
    before_action :current_user


    # GET /posts or /posts.json
    def index
        @conversations = Conversation.all

        # Render all conversations in JSON
        render json: @conversations
    end


    # GET /conversations/1 or /conversations/1.json
    def show

        # Render Conversation in JSON
        render json: @conversation, include: [:messages]
    end



    def check
        @conversation = Conversation.where(name: params[:name])

        render json: @conversation
    end


    # GET /conversations/new
    def new
        @conversation = Conversation.new
    end




    # POST /conversations or /conversations.json
    def create
        @conversation = Conversation.new(conversation_params)
        
        if @conversation.save
            render json: @conversation,  status: :created
        else
            render json: @conversation.errors, status: :unprocessable_entity
        end
    end



  


    private

    
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
        @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
        params.require(:conversation).permit(:name, :user_a_id, :user_b_id)
    end

end