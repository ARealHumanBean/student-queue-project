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
  
  def self.full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def self.import(file)
    @num_users_created = 0
    CSV.foreach(file.path, headers: true) do |row|
      user = User.create(camosun_id: row["camosun_id"], role: row["role"], first_name: row["first_name"], last_name: row["last_name"])
      @num_users_created += 1 if user.persisted?
    end
  end
end
