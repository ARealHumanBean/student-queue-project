class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  # before any controller action, check to make sure a user is logged in. 
  before_action :require_login
  
  private
  
  # redirect to login page if user isn't logged in
  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end
  
  # redirect back or to a new request if not an instructor
  def require_instructor
    unless current_user.instructor?
      redirect_back(fallback_location: new_request_path)
    end
  end
  
  # Redirect back or to manage request if not a student
  def require_student 
    unless current_user.student?
      redirect_back(fallback_location: manage_requests_path)
    end
  end
end
