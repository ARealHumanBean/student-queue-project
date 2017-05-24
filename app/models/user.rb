class User < ApplicationRecord
  has_one :request
  
  validates :camosun_id, presence: true, length: { maximum: 8 }, 
    uniqueness: true
  validates :role, presence: true
  validates :first_name, length: { maximum: 20 }
  validates :last_name, length: { maximum: 20 }
end
