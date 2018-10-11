class Experience < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :start_date, presence: true
	validate :end_date_after_start_date

	def end_date_after_start_date
		if end_date < start_date
			errors.add :end_date, "Must be after Start Date"
		end
	end

	# if currently_working is set to true, end date does not need presence
end
