class Job < ApplicationRecord
	belongs_to :company, counter_cache: true
	has_many :bookings, dependent: :destroy
end
