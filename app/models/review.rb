class Review < ApplicationRecord
  belongs_to :employer
  belongs_to :jobhunter
end
