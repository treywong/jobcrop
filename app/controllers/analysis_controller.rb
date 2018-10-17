class AnalysisController < ApplicationController
    def follower_analysis
	    @employer = current_user.employer
	    @company = @employer.company
		@follower = Follow.all.where(company_id: @company.id)
		@job = Job.all.where(company_id: @company.id)

		@booking_data = []
		job_exist = []
		@job.each do |j|
			if job_exist.exclude?(j.id)
				@booking = Booking.all.where(job_id: j.id)
				job_exist << j.id
				@booking.each do |b|
					@booking_data << b
				end
			end
		end

		@jobhunter_data = []
		@user_data = []
		@education_data = []
		@language_data = []
		@follower.each do |f|
			@jobhunter = Jobhunter.find_by(id: f.jobhunter_id)
			@jobhunter_data << @jobhunter

			@user = User.find_by(id: @jobhunter.user_id)
			@user_data << @user

			@education = Education.find_by(user_id: @user.id)
			@education_data << @education

			@language = Language.find_by(user_id: @user.id)
			@language_data << @language
		end

		@database = []
		@data_title = ['Gender','Age','Language','Highest qualification','Position-expected','Salary-expected']

		# gender
		gender_database = {}
		@user_data.each do |u|
			if gender_database[u.gender] == nil
				gender_database[u.gender] = 1
			else
				gender_database[u.gender] += 1
			end
		end
		@database << gender_database

		# age
		age_database = {}
		@user_data.each do |u|
			age = Date.today.year - u.birthday.year

			if age % 10 == 0
				age_range = (age + 1).to_s + " to " + (age + 10).to_s
			else
				age_range = (age.floor(-1) + 1).to_s + " to " + age.ceil(-1).to_s
			end

			if age_database[age_range] == nil
				age_database[age_range] = 1
			else
				age_database[age_range] += 1
			end
		end
		@database << age_database

		# language
		language_database = {}
		@language_data.each do |l|
			if language_database[l.dialect] == nil
				language_database[l.dialect] = 1
			else
				language_database[l.dialect] += 1
			end
		end
		@database << language_database

		# education
		education_database = {}
		@education_data.each do |e|
			if education_database[e.qualification] == nil
				education_database[e.qualification] = 1
			else
				education_database[e.qualification] += 1
			end
		end
		@database << education_database

		# Position and salary expectation
		position_database = {}
		salary_database = {}
		@jobhunter_data.each do |j|

			# position
			j.database_generate(position_database, j.position_expectation)

			#salary
			if j.salary_expectation % 1000 == 0
				salary_range = (j.salary_expectation).to_s + " to " + (j.salary_expectation.to_i + 1000).to_s
			else
				salary_range = (j.salary_expectation.to_i.floor(-3)).to_s + " to " + j.salary_expectation.to_i.ceil(-3).to_s
			end
			j.database_generate(salary_database, salary_range)
		end
		@database << position_database
		@database << salary_database

    end

    def applicant_analysis
    	@employer = current_user.employer
	    @company = @employer.company
	    @job = Job.all.where(company_id: @company.id)

	    @jobhunter_data = []
	    @user_data = []
		@education_data = []
		@language_data = []
	    @job.each do |j|
	    	@booking = Booking.all.where(job_id: j.id)
	    	@booking.each do |b|
	    		if @jobhunter_data.exclude?(Jobhunter.find_by(id: b.jobhunter_id))
	    			@jobhunter_data << Jobhunter.find_by(id: b.jobhunter_id)
	    		end
	    	end
	    end

	    @jobhunter_data.each do |j|
	    	@user = User.find_by(id: j.user_id)
			@user_data << @user

			@education = Education.find_by(user_id: @user.id)
			@education_data << @education

			@language = Language.find_by(user_id: @user.id)
			@language_data << @language
	    end


    	@database = []
		@data_title = ['Gender','Age','Language','Highest qualification','Position-expected','Salary-expected']

		# gender
		gender_database = {}
		@user_data.each do |u|
			if gender_database[u.gender] == nil
				gender_database[u.gender] = 1
			else
				gender_database[u.gender] += 1
			end
		end
		@database << gender_database

		# age
		age_database = {}
		@user_data.each do |u|
			age = Date.today.year - u.birthday.year

			if age % 10 == 0
				age_range = (age + 1).to_s + " to " + (age + 10).to_s
			else
				age_range = (age.floor(-1) + 1).to_s + " to " + age.ceil(-1).to_s
			end

			if age_database[age_range] == nil
				age_database[age_range] = 1
			else
				age_database[age_range] += 1
			end
		end
		@database << age_database

		# language
		language_database = {}
		@language_data.each do |l|
			if language_database[l.dialect] == nil
				language_database[l.dialect] = 1
			else
				language_database[l.dialect] += 1
			end
		end
		@database << language_database

		# education
		education_database = {}
		@education_data.each do |e|
			if education_database[e.qualification] == nil
				education_database[e.qualification] = 1
			else
				education_database[e.qualification] += 1
			end
		end
		@database << education_database

		# Position and salary expectation
		position_database = {}
		salary_database = {}
		@jobhunter_data.each do |j|
			# position
			j.database_generate(position_database, j.position_expectation)

			#salary
			if j.salary_expectation % 1000 == 0
				salary_range = (j.salary_expectation).to_s + " to " + (j.salary_expectation.to_i + 1000).to_s
			else
				salary_range = (j.salary_expectation.to_i.floor(-3)).to_s + " to " + j.salary_expectation.to_i.ceil(-3).to_s
			end
			j.database_generate(salary_database, salary_range)
		end
		@database << position_database
		@database << salary_database
	end

    def review_analysis
    	@employer = current_user.employer
	    @company = @employer.company
	    @review = Review.all.where(employer_id: @employer.id)
    end

    def job_analysis
    	@employer = current_user.employer
	    @company = @employer.company
	    @jobhunter_all = Jobhunter.all

	    @job_posted = Job.all.where(company_id: @company.id)

	    @job_booked = []
	    @jobhunter_all.each do |jobhunter|
	    	@job_in_company = jobhunter.jobs.where(company_id: @company.id)
	    	@job_in_company.each do |j|
	    		@job_booked << j
	    	end
	    end

	    @job_field_database = []
	    @job_country_database = []

	    job_posted_field = {}
	    job_posted_country = {}
	    job_booked_field = {}
		job_booked_country = {}

	    @job_posted.each do |j|
			if job_posted_field[j.field] == nil
				job_posted_field[j.field] = 1
			else
				job_posted_field[j.field] += 1
			end

			if job_posted_country[j.country] == nil
				job_posted_country[j.country] = 1
			else
				job_posted_country[j.country] += 1
			end
		end

		@job_booked.each do |j|
			if job_booked_field[j.field] == nil
				job_booked_field[j.field] = 1
			else
				job_booked_field[j.field] += 1
			end

			if job_booked_country[j.country] == nil
				job_booked_country[j.country] = 1
			else
				job_booked_country[j.country] += 1
			end
		end

		@job_field_database = [
		  {
		    name: "Jobs Posted", 
		    data: job_posted_field
		  },
		  {
		    name: "Jobs Booked", 
		    data: job_booked_field
		  }
		]

		@job_country_database = [
		  {
		    name: "Jobs Posted", 
		    data: job_posted_country
		  },
		  {
		    name: "Jobs Booked", 
		    data: job_booked_country
		  }
		]

    end

    
    
    
end

