class Jobhunter < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :companies, through: :follows
  has_many :bookings, dependent: :destroy
  has_many :jobs, through: :bookings

	def database_generate(database, data)
    	if database[data] == nil
			database[data] = 1
		else
			database[data] += 1
		end
    end
end
