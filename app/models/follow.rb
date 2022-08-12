class Follow < ApplicationRecord
    
    # The user giving the follow
    belongs_to :follower, foreign_key: :follower_id, class_name: "User"

    # The user being followed
    belongs_to :followed_user, foreign_key: :followed_user_id, class_name: 'User'


    after_create_commit :notify_recipient
    before_destroy :cleanup_notifications

    has_noticed_notifications model_name: 'Notification'



    def notify_recipient
        FollowNotification.with(follow: self).deliver_later(followed_user)
    end


    def cleanup_notifications
        notifications_as_follow.destroy_all
    end
end
