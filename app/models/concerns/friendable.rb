module UserConcern
   extend ActiveSupport::Concern

   included do
    #scopes for friendships
    has_many :friendships
    has_many :friends, through: :friendships
    has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"
    has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
    has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
    has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
    has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
   end
end