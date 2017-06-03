require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @instructor = users(:instructor)
    @student = users(:student)
  end
  
  test "login instructor with valid information" do
    get login_path
    post login_path, params: { session: { camosun_id: @instructor.camosun_id } }
    assert_redirected_to manage_requests_path
    follow_redirect!
    assert_template 'requests/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", new_request_path, count: 0
    assert_select "a[href=?]", new_user_path
    assert_select "a[href=?]", manage_requests_path
    assert_select "a[href=?]", manage_users_path
    assert_select "a[href=?]", logout_path
  end
  
  test "login student with valid information" do
    get login_path
    post login_path, params: { session: { camosun_id: @student.camosun_id } }
    assert_redirected_to new_request_path
    follow_redirect!
    assert_template 'requests/new'
    
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", manage_requests_path, count: 0
    assert_select "a[href=?]", manage_users_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", new_user_path
    assert_select "a[href=?]", new_request_path
    assert_select "a[href=?]", request_path

    
  end
  
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { camosun_id: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
