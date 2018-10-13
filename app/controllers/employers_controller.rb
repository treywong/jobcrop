class EmployersController < ApplicationController
	def index
	end

	def new
		@user = current_user
		@employer = current_user.employer
		if signed_out?
			redirect_to root_path
		end
	end

	def create
		@user = User.find(params[:user_id])
		@employer = @user.build_employer(employer_params)

		if @employer.save
			respond_to do |format|
			  format.js
			end
		else
			redirect_back(fallback_location: new_user_employer_path)
		end
	end


	def company_page

		@company = Company.find_by_id(params[:id])
		@follower = Follow.all.where(company_id: params[:id])
		@timeline = CompanyTimeline.all.where(company_id: params[:id]).last
	end

	def edit
		@company = Company.find_by(id: params[:id])
	end

	def update
		@company = Company.find_by(id: params[:id])
		@company.update(company_params)
		@company.save

		redirect_to company_page_path(@company.id)
	end

	def review_page
		@company = Company.find_by_id(params[:id])
		@review = Review.all.where(employer_id: @company.employer.id)

		# For overall rating
		total = 0
		@review.each do |r|
			total += r.rating
		end
		@overall_rating = total / @review.count
	end

	def analysis_page
		# Check topfunky/gruff gem to create the pi chart
		# Will use gender, age,
		@company = Company.find_by_id(params[:id])
		@follower = Follow.all.where(company_id: @company.id)

		@jobhunter_data = []
		@user_data = []
		@education_data = []
		@follower.each do |f|
			@jobhunter = Jobhunter.find_by(id: f.jobhunter_id)
			@jobhunter_data << @jobhunter

			@user = User.find_by(id: @jobhunter.user_id)
			@user_data << @user

			@education = Education.find_by(user_id: @user.id)
			@education_data << @education
		end

		@database = []
		@data_title = ['Gender','Age','Highest qualification','Job-title-expected','Position-expected','Salary-expected']

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
			# age -= 1 if Date.today < u.birthday + age.years   # not sure to include this as it'll only work with rails

			# age_range = age.floor(-1).to_s + " to " + age.ceil(-1).to_s # this has a problem with 10,20,30...

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

		# title,position and salary expectation
		title_database = {}
		position_database = {}
		salary_database = {}
		@jobhunter_data.each do |j|

			# title
			if title_database[j.title_expectation] == nil
				title_database[j.title_expectation] = 1
			else
				title_database[j.title_expectation] += 1
			end

			# position
			if position_database[j.position_expectation] == nil
				position_database[j.position_expectation] = 1
			else
				position_database[j.position_expectation] += 1
			end

			#salary
			if j.salary_expectation % 1000 == 0
				salary_range = (j.salary_expectation).to_s + " to " + (j.salary_expectation.to_i + 1000).to_s
			else
				salary_range = (j.salary_expectation.to_i.floor(-3)).to_s + " to " + j.salary_expectation.to_i.ceil(-3).to_s
			end

			if salary_database[salary_range] == nil
				salary_database[salary_range] = 1
			else
				salary_database[salary_range] += 1
			end
		end
		@database << title_database
		@database << position_database
		@database << salary_database

	end

	private
	def employer_params
		params.require(:employer).permit(
			:title,
			:preferences
		)
	end

	def company_params
		params.require(:company).permit(:name, :website, :telephone, :background, :location, :size, :logo)
	end

end
