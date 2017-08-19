class AgreementParty < SecondBase::Base
  belongs_to :agreement
  belongs_to :agreeable, polymorphic: true
end
