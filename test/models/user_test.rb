require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @instructor = User.new(camosun_id: "C1234567", role: 0, 
      first_name: "Example", last_name: "Instructor")
    @student = User.new(camosun_id: "C8765432", role: 1, 
      first_name: "Example", last_name: "Student")
  end
  
  test "instructor should be valid" do 
    assert @instructor.valid?
  end
  
  test "Student should be valid" do
    assert @student.valid?
  end
  
  
end
