class User < ApplicationRecord
	has_many :jobs
	has_many :bookings
end
