class Tracker < ApplicationRecord

	has_many :roas

	after_initialize :set_default_status, if: :new_record?

	def set_default_status
    	self.active ||= true
  	end
end
