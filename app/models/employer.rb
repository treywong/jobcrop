class Employer < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :jobhunters, through: :reviews
  has_many :freelances, dependent: :destroy
  has_one :company, dependent: :destroy
end
