class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

    
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :post_likes, dependent: :destroy
    
    has_many :messages, dependent: :destroy

    # Images
    has_one_attached :avatar
    has_one_attached :cover

    after_commit :add_default_avatar, on: %i[create update]
    after_commit :add_default_cover, on: %i[create update]

            
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


    # Returns an array of conversations where user is user_a
    has_many :initiated_conversations, foreign_key: :user_a_id, class_name: 'Conversation'

    # Returns an array of conversations where user is user_b
    has_many :received_conversations, foreign_key: :user_b_id, class_name: 'Conversation'



    has_many :notifications, as: :recipient, dependent: :destroy


     # Authenticate User Method taken from the Devise documentation
    def self.authenticate(email, password)
        user = User.find_for_authentication(email: email)
        user&.valid_password?(password) ? user : nil
    end



    # Create Url for Avatar
    def image_url
        Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
    end

    # Create Url for Cover
    def cover_url
        Rails.application.routes.url_helpers.url_for(cover) if cover.attached?
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


    def add_default_cover
        return if cover.attached?

        cover.attach(
            io: File.open(Rails.root.join('app', 'assets', 'images', 'CoverRock.png')),
            filename: 'CoverRock.png',
            content_type: 'image/png'
        )  
    end
end
