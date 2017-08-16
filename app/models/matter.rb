class Matter < ApplicationRecord
  belongs_to :matterable
  include Item

  has_closure_tree

  self.inheritance_column = :type
  has_many :matters, as: :matterable
  has_many :tasks, as: :taskable
  has_many :issues, as: :issuable

  attr_accessor :pending_tasks_tokens, :started_tasks_tokens, :completed_tasks_token

  attr_reader :pending_tasks_tokens

  def pending_task_tokens=(tokens)
    self.pending_task_ids = Task.ids_from_tokens(tokens)
  end

  attr_reader :started_tasks_tokens

  def started_task_tokens=(tokens)
    self.started_task_ids = Task.ids_from_tokens(tokens)
  end

  attr_reader :completed_tasks_tokens

  def completed_task_tokens=(tokens)
    self.completed_task_ids = Task.ids_from_tokens(tokens)
  end

  def started_tasks
    self.tasks.where(status_id: 2)
  end

  def pending_tasks
    self.tasks.where(status_id: [1, 3])
  end

  def completed_tasks
    self.tasks.where(status_id: [4, 5])
  end


  def parentable
    self.matterable
  end

end
