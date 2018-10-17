class Job < ApplicationRecord
	belongs_to :company, counter_cache: true
	has_many :bookings, dependent: :destroy

	def location
    	"#{self.address} #{self.state} #{self.country} #{self.zipcode}"
 	end
end
