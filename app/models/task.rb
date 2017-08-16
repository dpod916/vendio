class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true
  include Item


  self.inheritance_column = :type

  def self.ids_from_tokens(tokens)
   tokens.to_a.map {|t| t.to_i }
  end

  def parentable
    self.taskable
  end

end
