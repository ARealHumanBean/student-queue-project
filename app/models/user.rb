class User < ApplicationRecord
  has_one :request, dependent: :destroy
  
  enum role: [:instructor, :student]
  # set role to student by default
  after_initialize :set_default_role, :if => :new_record?
  
  validates :camosun_id, presence: true, length: { maximum: 8 }, 
    uniqueness: true
  validates :role, presence: true
  validates :first_name, length: { maximum: 20 }
  validates :last_name, length: { maximum: 20 }
  
  def set_default_role
    self.role ||= :student
  end
end
