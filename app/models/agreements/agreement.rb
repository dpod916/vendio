class Agreement < ApplicationRecord
  belongs_to :vendor, optional: true
  belongs_to :company, optional: true
  has_many :terms, as: :termable

  self.inheritance_column = :type


end
