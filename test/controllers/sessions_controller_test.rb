require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session
  
  test "should get new" do
    get login_path
    assert_response :success
  end
end
