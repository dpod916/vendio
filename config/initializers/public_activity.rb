PublicActivity::Activity.class_eval do
  before_save :check_entry
  belongs_to :trackable, polymorphic: true
  belongs_to :recipient, polymorphic: true
  belongs_to :owner, polymorphic: true
  has_many :comments, as: :commentable

  delegate :title, to: :trackable, prefix: true, allow_nil: true
  delegate :title, to: :recipient, prefix: true, allow_nil: true

  def changes_hash
    JSON.parse self.parameters[:changes]
  end

  def avatar_updated?
   self.parameters[:changes].nil? ?  false : changes_hash.has_key?("avatar_file_name")
  end

  def check_entry
    if self.trackable_type == 'Entry'
      self.created_at = self.trackable.published
    end
  end

end
PublicActivity::ORM::ActiveRecord::Activity.class_eval do
  before_save :check_entry
  belongs_to :trackable, polymorphic: true
  belongs_to :recipient, polymorphic: true
  belongs_to :owner, polymorphic: true
  has_many :comments, as: :commentable

  delegate :title, to: :trackable, prefix: true, allow_nil: true
  delegate :title, to: :recipient, prefix: true, allow_nil: true

  def changes_hash
    JSON.parse self.parameters[:changes]
  end

  def avatar_updated?
   self.parameters[:changes].nil? ?  false : changes_hash.has_key?("avatar_file_name")
  end

  def check_entry
    if self.trackable_type == 'Entry'
      self.created_at = self.trackable.published
    end
  end

end