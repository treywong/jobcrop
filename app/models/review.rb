class Review < ApplicationRecord
  belongs_to :employer, counter_cache: :jobhunters_count
  belongs_to :jobhunter
end
