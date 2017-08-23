class Consultant < ApplicationRecord
  belongs_to :user, optional: true
  has_many :resourceable_resources, as: :resource

end
