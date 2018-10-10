class User < ApplicationRecord
	include Clearance::User
	
	belongs_to :company
	has_many :jobs
	has_many :bookings
end
