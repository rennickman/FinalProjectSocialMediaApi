class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable


            
    # Enum to represent User Roles - Default is set to 0 (:user) when Devise User account is first created
    enum role: %i[user, admin]


    # Email Validation
    validates :email, format: URI::MailTo::EMAIL_REGEXP



     # Authenticate User Method taken from the Devise documentation
    def self.authenticate(email, password)
        user = User.find_for_authentication(email: email)
        user&.valid_password?(password) ? user : nil
    end
end
