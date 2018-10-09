class User < ApplicationRecord
  include Clearance::User

	has_many :jobs
	has_many :bookings
end
