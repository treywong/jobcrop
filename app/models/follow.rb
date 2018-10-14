class Follow < ApplicationRecord
  belongs_to :company, counter_cache: true
  belongs_to :jobhunter, counter_cache: true
end
