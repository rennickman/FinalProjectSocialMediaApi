class Api::V1::NotificationsController < ApiController
    before_action :set_conversation, only: %i[ show edit update destroy ]
    # Call method to get Current User from Access Token
    before_action :current_user


    # GET /notifications or /notifications.json
    def index
        @notifications = Notification.where(recipient_id: current_user.id)

        # Render all conversations in JSON
        render json: @notifications
    end


  


    private

    

end