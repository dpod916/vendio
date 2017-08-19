class Consultant < SecondBase::Base
  belongs_to :user
  belongs_to :vendor
end
