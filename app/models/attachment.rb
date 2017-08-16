class Attachment < ApplicationRecord
  belongs_to :user
  belongs_to :attachable, polymorphic: true
  searchkick
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
             title: Proc.new { |controller, model| model.file_file_name },
             recipient: Proc.new { |controller, model| model.attachable },
             :params => {
              :changes => Proc.new {|controller, model| model.changes.to_json}
          }

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => ["application/pdf","application/vnd.ms-excel",
            "application/zip",
            "application/x-zip",
            "application/x-zip-compressed",
            "application/octet-stream",
            "application/vnd.ms-office",
            "application/msword",
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword",
             "application/mspowerpoint",
             "text/csv",
             "application/vnd.openxmlformats-officedocument.presentationml.presentation",
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             "text/plain",
         	   "image/jpeg",
         	   "image/png",
         	   "image/gif"]



end
