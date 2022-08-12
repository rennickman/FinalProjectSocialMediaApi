class PostLike < ApplicationRecord
    belongs_to :post
    belongs_to :user


    after_create_commit :notify_recipient
    before_destroy :cleanup_notifications

    has_noticed_notifications model_name: 'Notification'



    def notify_recipient
        LikeNotification.with(post_like: self, post: post).deliver_later(post.user)
    end


    def cleanup_notifications
        notifications_as_post_like.destroy_all
    end
end
