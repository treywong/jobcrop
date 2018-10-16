# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
	50.times do
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
			jobhunter["preferences"] = Faker::Hipster.paragraph
    		jobhunter["title_expectation"] = Faker::Job.title
    		jobhunter["salary_expectation"] = rand(1000..5000)
    		jobhunter["position_expectation"] = Faker::Job.position

    		jobhunter['user_id'] = u
			Jobhunter.create(jobhunter)
		end

		education["institute"] = Faker::Educator.university
	    education["qualification"] = Faker::Job.education_level
	    education["location"] = Faker::Address.full_address
	    education["major"] = Faker::Educator.subject
	    education["description"] = Faker::Hipster.paragraph
	    # education["graduation_year"] = Faker::
	    education["currently_studying"] = ["yes","no"].sample

	    education['user_id'] = u
		Education.create(education)

		experience["title"] = Faker::Job.title
	    experience["company"] = Faker::Company.name
	    experience["location"] = Faker::Address.full_address
	    experience["salary"] = rand(1000..5000)
	    # experience["start_date"] = Faker::
	    # experience["end_date"] = Faker::
	    experience["description"] = Faker::Hipster.paragraph
	    experience["currently_working"] = ["yes","no"].sample

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
	    company["background"] = Faker::Hipster.paragraph
	    company["location"] = Faker::Address.full_address
	    company["size"] = rand(50..1000)
	    company["remote_logo_url"] = Faker::Company.logo

	    company['employer_id'] = e
		Company.create(company)
	end
end

job = {}
timeline = {}
company_ids = Company.ids
ActiveRecord::Base.transaction do
	1000.times do
		job["title"] = Faker::Job.title
	    job["salary"] = rand(1000..5000)
	    job["details"] = Faker::DumbAndDumber.quote # Just for laughs
	    job["location"] = Faker::Address.full_address
	    job["photos"] = Faker::Avatar.image

	    job['company_id'] = company_ids.sample
		Job.create(job)
	end
end

ActiveRecord::Base.transaction do
	company_ids.each do |c|
		3.times do
			timeline["title"] = Faker::ChuckNorris.fact # Just for laughs
	    	timeline["description"] = Faker::Hipster.paragraph
	    	timeline["photo"] = Faker::Avatar.image

	    	timeline['company_id'] = c
			CompanyTimeline.create(timeline)
		end
	end
end

follow = {}
review = {}
jobhunter_ids = Jobhunter.ids
ActiveRecord::Base.transaction do
	jobhunter_ids.each do |j|
		follow['company_id'] = company_ids.sample
	    follow['jobhunter_id'] = j
		Follow.create(follow)

		review["title"] = Faker::FunnyName.name
	    review["description"] = Faker::Hipster.paragraph
	    review["rating"] = rand(1..5)
		review['employer_id'] = employer_ids.sample
	    review['jobhunter_id'] = j
		Review.create(review)
	end
end
