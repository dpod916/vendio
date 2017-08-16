module Profilable
   extend ActiveSupport::Concern

   included do
     include Searchable
    #  after_create :create_profile
     has_one :profile, as: :profilable, dependent: :destroy
     delegate :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar,
           :avatar_updated_at, :avatar_url, :tag_line, :description,
           to: :profile, allow_nil: true

     private
      def create_profile
         Profile.create(profilable: self)
      end
   end
end