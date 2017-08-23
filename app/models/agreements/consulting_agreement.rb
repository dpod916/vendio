class ConsultingAgreement < MasterAgreement
  before_create :set_type

  private
  def set_type # If you don't implement this method, an error will be raised
    self.type = 'ConsultingAgreement'
  end
end
