class VendorAgreement < ApplicationRecord
  belongs_to :vendor, optional: true
  belongs_to :company, optional: true
  belongs_to :agreement, optional: true
  has_many :comments, as: :commentable
  has_many :assignments, as: :assignable
  has_many :attachments, as: :attachable
  has_many :contacts, as: :contactable
end
