class Profile < ApplicationRecord
  belongs_to :profilable, polymorphic: true
  include PublicActivity::Model
  # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
  #         title: :name,
  #         recipient: :profilable,
  #         :params => {
  #             :changes => Proc.new {|controller, model| model.changes.to_json}
  # #         }
  # @admin = User.where(email: 'daniel.podvesker@bunge.com').first
  # tracked owner: @admin,
  #         title: :name,
  #         recipient: :profilable


  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg",
                                                               "image/png"]

private


end
