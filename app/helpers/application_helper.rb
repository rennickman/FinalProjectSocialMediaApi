module ApplicationHelper

    # Method for checking if a User had Admin Credentials
    def is_admin?
        unless current_user&.admin?
            redirect_to root_path, alert: "You are not authorized to access this page"
        end
    end
end
