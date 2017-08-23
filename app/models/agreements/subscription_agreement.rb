class SubscriptionAgreement < MasterAgreement

	  def set_type # If you don't implement this method, an error will be raised
      self.type = 'SubscriptionAgreement'
    end
end
