class Job < ApplicationRecord
	belongs_to :company, counter_cache: true
	has_many :bookings, dependent: :destroy
	include PgSearch
	pg_search_scope :search_by_title, :against => [:title, :location], :using => {:tsearch => {:any_word => true}}
end
