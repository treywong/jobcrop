class Company < ApplicationRecord
  belongs_to :employer
  has_many :jobs, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :jobhunter, through: :follows
end
