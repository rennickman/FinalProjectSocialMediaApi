class Post < ApplicationRecord

    belongs_to :user

    has_many :comments, dependent: :destroy
    has_many :post_likes, dependent: :destroy

    has_one_attached :image



    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy



    # Create Url for Image if post has one
    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end

end
