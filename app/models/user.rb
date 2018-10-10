class User < ApplicationRecord
  include Clearance::User

	has_many :jobs
	has_many :bookings

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
