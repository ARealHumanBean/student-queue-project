class Request < ApplicationRecord
  belongs_to :user
  
  enum type: {quick_question: 0, support: 1, demo: 2}
  # Set type to quick_question by default
  after_initialize :set_default_type, :if => :new_record?
  
  validates :queue_type, presence: true
  
  def set_default_type
    self.queue_type ||= :quick_question
  end
  

end
