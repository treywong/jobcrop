class Jobhunter < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :companies, through: :follows
  has_many :bookings, dependent: :destroy
  has_many :jobs, through: :bookings
end
