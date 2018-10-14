class Language < ApplicationRecord
	belongs_to :user

	def writing?
		if self.writing == 2
			"Fluent"
		elsif self.writing == 1
			"Good"
		else
			"Not Good"
		end
	end

	def speaking?
		if self.speaking == 2
			"Fluent"
		elsif self.speaking == 1
			"Good"
		else
			"Not Good"
		end
	end
end
