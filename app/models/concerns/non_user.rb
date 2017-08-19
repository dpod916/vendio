module NonUser
   extend ActiveSupport::Concern

   included do
     include Profilable
     has_many :comments, as: :commentable
     has_many :attachments, as: :attachable
     has_many :posts, as: :postable
     include PublicActivity::Model
    # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
    #       title: :name,
    #       recipient: Proc.new { |controller, model| model.parentable ? model.parentable : nil },
    #       :params => {
    #           :changes => Proc.new {|controller, model| model.changes.to_json}
    #       }

    # tracked owner: User.find(2644),
    #         title: :name,
    #         recipient: Matter.first
   end
end