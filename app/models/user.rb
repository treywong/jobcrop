class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader

	has_many :languages, dependent: :destroy
	has_many :experiences, dependent: :destroy
	has_many :educations, dependent: :destroy
	has_many :skills, dependent: :destroy
	has_many :projects, dependent: :destroy

  has_one :employer, dependent: :destroy
  has_one :jobhunter, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, if: :email
  validates :password, presence: true, if: :password

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def own_profile?(user)
    self.id == user.id
  end
end
