module Itemable
   extend ActiveSupport::Concern

   included do

     has_many :owned_activities, -> { includes(:trackable, :recipient, :owner) }, as: :owner, source: :activity
     has_many :tracked_activities, -> { includes(:trackable, :recipient, :owner) }, as: :trackable, source: :activity
     has_many :received_activities, -> { includes(:trackable, :recipient, :owner) }, as: :recipient, source: :activity
     scope :activities, -> {self.tracked_activities + self.received_activities + self.owned_activities}


     has_one :profile, as: :profilable, dependent: :destroy, inverse_of: :profilable
     delegate :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar,
           :avatar_updated_at, :avatar_url, :name, :title, :tag_line, :description,
           to: :profile
   end
end