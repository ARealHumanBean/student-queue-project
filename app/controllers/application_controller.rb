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
end
