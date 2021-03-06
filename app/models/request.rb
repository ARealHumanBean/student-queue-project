class Request < ApplicationRecord
  belongs_to :user
  
  enum queue_type: {question: 0, support: 1, demo: 2}
  # Set type to question by default
  after_initialize :set_default_type, :if => :new_record?
  
  validates :queue_type, presence: true
  
  def set_default_type
    self.queue_type ||= :question
  end
end
