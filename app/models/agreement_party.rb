class AgreementParty < ApplicationRecord
  belongs_to :agreement
  belongs_to :agreeable, polymorphic: true
end
