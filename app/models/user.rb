class User < ApplicationRecord
  include Clearance::User

	has_many :jobs
	has_many :bookings
	has_many :experiences
	has_many :educations
	has_many :skills
	has_many :projects

	has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
	has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
	has_many :personal_messages, dependent: :destroy

	# def name
 #  		email.split('@')[0]
	# end
end
