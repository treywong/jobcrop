# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = 'asdf'

language = {}

ActiveRecord::Base.transaction do
	100.times do
		user['first_name'] = Faker::Name.first_name
		user['last_name'] = Faker::Name.last_name

		user["birthday"] = Faker::Date.birthday(18, 65)
    	user["email"] = Faker::Internet.email
    	user["gender"] = Faker::Gender.binary_type
    	user["phone"] = Faker::PhoneNumber.cell_phone
    	user["remote_avatar_url"] = Faker::Avatar.image
    	user["about_me"] = Faker::Hipster.paragraph
    	user["address"] = Faker::Address.street_address
    	user["state"] = Faker::Address.state
    	user["zipcode"] = Faker::Address.zip_code
    	user["country"] = Faker::Address.country

		User.create(user)

		language["dialect"] = Faker::Nation.language
		language["user_id"] = User.last.id

		Language.create(language)
	end
end

jobhunter = {}
employer = {}
education = {}
experience = {}
user_ids = User.ids

ActiveRecord::Base.transaction do
	user_ids.each do |u|
		if (u) % 5 == 0
			employer["title"] = Faker::Job.title
    		employer["preferences"] = Faker::Hipster.paragraph

			employer['user_id'] = u
			Employer.create(employer)
		elsif
			jobhunter["preferences"] = Faker::Lorem.paragraph(5)
    		jobhunter["title_expectation"] = Faker::Job.title
    		jobhunter["salary_expectation"] = rand(1000..5000)
    		jobhunter["position_expectation"] = Faker::Job.position

    		jobhunter['user_id'] = u
			Jobhunter.create(jobhunter)
		end

		education["institute"] = Faker::Educator.university
	    education["qualification"] = Faker::Job.education_level
	    education["location"] = Faker::Address.city
	    education["major"] = Faker::Educator.subject
	    education["description"] = Faker::Lorem.paragraph(4)
	    # education["graduation_year"] = Faker::
	    education["currently_studying"] = rand(0..1)

	    education['user_id'] = u
		Education.create(education)

		experience["title"] = Faker::Job.title
	    experience["company"] = Faker::Company.name
	    experience["location"] = Faker::Address.city
	    experience["salary"] = rand(1000..5000)
	    # experience["start_date"] = Faker::
	    # experience["end_date"] = Faker::
	    experience["description"] = Faker::Lorem.paragraph(2)
	    experience["currently_working"] = rand(0..1)

	    experience['user_id'] = u
		Experience.create(experience)
	end
end

company = {}
employer_ids = Employer.ids
ActiveRecord::Base.transaction do
	employer_ids.each do |e|
		company["name"] = Faker::Company.name
	    company["website"] = Faker::Internet.url
	    company["telephone"] = Faker::PhoneNumber.phone_number
	    company["background"] = Faker::Lorem.paragraph(50)
	    company["location"] = Faker::Address.city
	    company["size"] = rand(0..1000)
	    company["remote_logo_url"] = Faker::Company.logo

	    company['employer_id'] = e
		Company.create(company)
	end
end

job = {}
timeline = {}
company_ids = Company.ids
ActiveRecord::Base.transaction do
	500.times do
		job["title"] = Faker::Job.title
		job["field"] = Faker::Job.field
	    job["salary"] = rand(1000..5000)
	    job["details"] = Faker::Lorem.paragraph(30)
	    job["address"] = Faker::Address.street_address
    	job["state"] = Faker::Address.state
    	job["zipcode"] = Faker::Address.zip_code
    	job["country"] = Faker::Address.country
	    job["photos"] = Faker::Avatar.image

	    job['company_id'] = company_ids.sample
		Job.create(job)
	end
end

# ActiveRecord::Base.transaction do
# 	company_ids.each do |c|
# 		3.times do
# 			timeline["title"] = Faker::ChuckNorris.fact # Just for laughs
# 	    	timeline["description"] = Faker::Hipster.paragraph
# 	    	timeline["photo"] = Faker::Avatar.image("50x50")
#
# 	    	timeline['company_id'] = c
# 			CompanyTimeline.create(timeline)
# 		end
# 	end
# end

follow = {}
review = {}
booking = {}
job_ids = Job.ids
jobhunter_ids = Jobhunter.ids
ActiveRecord::Base.transaction do
	jobhunter_ids.each do |j|
		follow['company_id'] = company_ids.sample
	    follow['jobhunter_id'] = j
		Follow.create(follow)

		review["title"] = Faker::Company.bs
	    review["description"] = Faker::Lorem.paragraph(5)
	    review["rating"] = rand(1..5)
		review['employer_id'] = employer_ids.sample
		review["posted_at"] = Faker::Time.between(1.year.ago, DateTime.now)
	    review['jobhunter_id'] = j
		Review.create(review)

		booking["jobhunter_id"] = j
		booking["job_id"] = job_ids.sample
		Booking.create(booking)
	end


end
