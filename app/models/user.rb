class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :post_likes, dependent: :destroy

    has_one_attached :avatar

    after_commit :add_default_avatar, on: %i[create update]


            
    # Enum to represent User Roles - Default is set to 0 (:user) when Devise User account is first created
    enum role: %i[user, admin]


    # Email Validation
    validates :email, format: URI::MailTo::EMAIL_REGEXP



    # Returns an array of follows where user is followed user
    has_many :reveived_follows, foreign_key: :followed_user_id, class_name: "Follow"

    # Returns an array of users who follow this user
    has_many :followers, through: :reveived_follows, source: :follower


    # Returns an array of follows this user made
    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"

    # Returns an array of users this user has followed
    has_many :followings, through: :given_follows, source: :followed_user




     # Authenticate User Method taken from the Devise documentation
    def self.authenticate(email, password)
        user = User.find_for_authentication(email: email)
        user&.valid_password?(password) ? user : nil
    end



    # Create Url for Avatar
    def image_url
        Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
    end




    private 



    def add_default_avatar
        return if avatar.attached?

        avatar.attach(
            io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')),
            filename: 'default_avatar.png',
            content_type: 'image/png'
        )  
    end
end
