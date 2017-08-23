class Consultant < SecondBase::Base
  belongs_to :user, optional: true
  has_many :resourceable_resources, as: :resource

end
