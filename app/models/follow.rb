class Follow < ApplicationRecord
  belongs_to :company, counter_cache: :jobhunters_count
  belongs_to :jobhunter
end
