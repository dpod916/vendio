class Comment < ApplicationRecord
include PublicActivity::Model
searchkick
tracked owner: Proc.new{ |controller, model| controller.current_user }
# tracked except: :update, owner: ->(controller, model) { controller && controller.User.current_user }
belongs_to :commentable, polymorphic: true
belongs_to :parent, optional: true
belongs_to :user
acts_as_tree order: 'created_at DESC'
has_closure_tree dependent: :delete_all
include Opinions::Pollable
opinions :like


# acts_as_notifiable :users,
# Notification targets as :targets is a necessary option
# Set to notify to author and users commented to the commentable, except comment owner self
# 	targets: ->(comment, key) {
#   		([comment.commentable.user] + comment.commentable.commented_users.to_a - [comment.user]).uniq
# 	},
# # Path to move when the notification is opened by the target user
# # This is an optional configuration since activity_notification uses polymorphic_path as default
# 	notifiable_path: :commentable_notifiable_path

#   def commentable_notifiable_path
#     commentable_path(commentable)
#   end


end
