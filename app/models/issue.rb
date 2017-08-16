class Issue < ApplicationRecord
  belongs_to :issuable, polymorphic: true
  include Item



  has_many :open_tasks, -> { self.tasks.where('status_id < 4') }
  has_many :closed_tasks, -> { self.tasks.where('status_id > 3') }


  def parentable
    self.issuable
  end

end
