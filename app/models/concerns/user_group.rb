module UserGroup
   extend ActiveSupport::Concern

   included do
      include Profilable
      delegate :title, to: :profile, allow_nil: true
      has_many :users
      has_many :comments, through: :users
      has_many :attachments, through: :users
      has_many :posts, through: :users
      has_many :user_assignments, through: :users
      has_many :matters, through: :users
      has_many :tasks, through: :users
      has_many :issues, through: :users
      acts_as_follower

   end
end