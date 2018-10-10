# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = {}
ActiveRecord::Base.transaction do
	10.times do
		company['name'] = Faker::Name.name
		company['location'] = Faker::Address.full_address
		company['website'] = Faker::Internet.url
		company['telephone'] = Faker::PhoneNumber.phone_number
		company['company_size'] = rand(50..200)
		company['overview'] = Faker::Hipster.paragraph
		company['join_us'] = Faker::Hipster.paragraph
		company['industry'] = Faker::Job.field

		Company.create(company)
	end
end

cids = []
Company.all.each { |c| cids << c.id }


user = {}
user['password'] = 'asdf'
ActiveRecord::Base.transaction do
	50.times do
		user['fullname'] = Faker::Name.name
		user['role'] = ['job_hunter','employer'].sample
		user['email'] = Faker::Internet.email
		user['detail'] = Faker::Hipster.paragraph

		if user['role'] == 'employer'
			user['company_id'] = cids.sample
		end

		User.create(user)
	end
end


job = {}
job['work_hour_start'] = 9
job['work_hour_end'] = 17
ActiveRecord::Base.transaction do
	20.times do
		job['name'] = Faker::Job.title
		job['work_location'] = Faker::Address.full_address
		job['description'] = Faker::Hipster.paragraph
		job['responsibility'] = Faker::Hipster.paragraph

		job['salary'] = rand(1000..3000)
		job['company_id'] = cids.sample


		Job.create(job)
	end
end
