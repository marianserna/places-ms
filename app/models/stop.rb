class Stop < ApplicationRecord
  belongs_to :trip
  
  validates :user_id, presence: true
end
