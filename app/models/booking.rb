class Booking < ApplicationRecord
	belongs_to :jobhunter
	belongs_to :job
end
