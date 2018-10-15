desc 'Counter cache for employer has many reviews'

task reviews_counter: :environment do
  Employer.find_each { |employer| Employer.reset_counters(employer.id, :reviews) }
end

desc 'Counter cache for company has many follows'

task follows_counter: :environment do
  Company.find_each { |company| Company.reset_counters(company.id, :follows) }
end

desc 'Counter cache for company has many jobs'

task jobs_counter: :environment do
  Company.find_each { |company| Company.reset_counters(company.id, :jobs) }
end
