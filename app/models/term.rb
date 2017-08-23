class Term < ApplicationRecord
  belongs_to :termable, polymorphic: true
end
