require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(id: 1, camosun_id: "C1234567", role: "instructor", 
      first_name: "Example", last_name: "Instructor")
    @request = Request.new(user_id: @user.id, queue_type: "demo", info: "blah")
  end
  
  test "user should be valid" do 
    assert @user.valid?
  end
  
  test "camosun_id should be present" do
    @user.camosun_id = ""
    assert_not @user
  end
end
