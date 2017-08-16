class SubAgreement < Agreement
end


# class PurchaseOrder < SubAgreement
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'PurchaseOrder'
#     end
# end

# class StatementWork < SubAgreement
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'StatementWork'
#     end
# end

# class AgreementExhibit < Agreement
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'AgreementExhibit'
#     end
# end

# class Addendum < AgreementExhibit
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'Addendum'
#     end
# end

# class Annex < AgreementExhibit
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'Annex'
#     end
# end

# class InsuranceCertificate < AgreementExhibit
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'InsuranceCertificate'
#     end
# end


# class SoftwareSchedule < AgreementExhibit
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'SoftwareSchedule'
#     end
# end


# class EngagementLetter < Agreement
# 	def set_type # If you don't implement this method, an error will be raised
#       self.type = 'EngagementLetter'
#     end
# end