class PagesController < ApplicationController
    def home
        # Get DoorKeeper Application so we can view Client ID and Client Secret on Home page
        @application = Doorkeeper::Application.find_by(name: "React")
        @application = {
            name: @application.name,
            client_id: @application.uid,
            client_secret: @application.secret
        }
    end
end
