class User < ApplicationRecord
  include Clearance::User

	has_many :jobs
	has_many :bookings
	has_many :experiences
	has_many :educations
	has_many :skills
end
