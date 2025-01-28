class Tracker < ApplicationRecord

	after_initialize :set_default_status, if: :new_record?

	def set_default_status
    	self.active ||= true
  	end
end
