module Api
    module V1
        module Users
            class RegistrationsController < ApiController
                # Skip doorkeeper authorization because we dont expect user to be logged in
                skip_before_action :doorkeeper_authorize!, only: %i[create]

                # Include the Doorkeeper Registerable Concern
                include DoorkeeperRegisterable


                def create
                    # Get Doorkeeper Application using Client Id in Params
                    client_app = Doorkeeper::Application.find_by(uid: user_params[:client_id])

                    # Send error message if Doorkeeper application not found
                    unless client_app
                        return render json: { error: I18n.t('doorkeeper.errors.messages.invalid_client') }, status: :unauthorized  
                    end

                    # Remove Client Id from params
                    allowed_params = user_params.except(:client_id)

                    # Create new user using Email and Password from params
                    user = User.new(allowed_params)

                    if user.save
                        # Return user if it was saved
                        render json: render_user(user, client_app), status: :ok
                    else 
                        # Return error message if User couldnt be saved
                        render json: { errors: user.errors }, status: :unprocessable_entity
                    end
                end



                private

                def user_params
                    params.permit(:email, :password, :firstname, :surname, :client_id, :status, :originalCity,
                                    :currentCity, :loves, :hates, :desc)
                end
            end
        end
    end
end