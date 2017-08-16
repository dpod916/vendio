class Termination < Task

	def set_type # If you don't implement this method, an error will be raised
      self.type = 'Termination'
    end

end
