class EmployersController < ApplicationController
	def company_page
		@company = current_company
		@follower = Follow.all.where(company_id: @company.id)
		@photo = @company.photos
		@timeline = CompanyTimeline.all.where(company_id: @company.id)
	end

	def company_edit
		
	end

	def company_update
		
	end

	def review_page
		@review = Review.all.where(employer_id: current_user.id)

	end

	def analysis_page
		# Check topfunky/gruff gem to create the pi chart
		# Will use gender, age, 
		@follower = Follow.all.where(company_id: @company.id)
		@user = @follower.jobhunter.user

		database = []
		data_title = ['gender','age']

		gender_database = {}
		@user.each do |u|
			if gender_database[u.gender] == nil
				gender_database[u.gender] = 1
			else
				gender_database[u.gender] += 1
			end
		end
		database << gender_database

		age_database = {}
		@user.each do |u|
			age = Date.today.year - u.birthday.year
			# age -= 1 if Date.today < u.birthday + age.years   # not sure to include this as it'll only work with rails
			if age_database[u.age] == nil
				age_database[u.age] = 1
			else
				age_database[u.age] += 1
			end
		end
		database << age_database




	end
end
