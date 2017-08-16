class Activity < PublicActivity::Activity
  before_save :check_entry
  belongs_to :trackable, polymorphic: true
  belongs_to :owner, polymorphic: true


  self.table_name = "activities"

  private

  def check_entry
  	if self.trackable_type == 'Entry'
  		self.created_at = self.trackable.published
  	end
  end

end