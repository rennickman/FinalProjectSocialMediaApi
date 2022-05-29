class ApiController < ApplicationController
    # Equivalent of Devise's authenticate_user method - but checks for oauth tokens
    # Only valid Access Tokens can access Api Controllers
    before_action :doorkeeper_authorize!


    # Skip checking CSRF token authenticity for API requests
    skip_before_action :verify_authenticity_token


    # Set response type to JSON
    respond_to :json




    private

    
    # Helper method to get the Current User from the Access Token
    def current_user
        return unless doorkeeper_token
        @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
    end
end