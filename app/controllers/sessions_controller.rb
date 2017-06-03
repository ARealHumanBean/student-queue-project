class SessionsController < ApplicationController
  skip_before_action :require_login, :only=>[:new, :create]
  before_action :redirect_login, :only=>[:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(camosun_id: params[:session][:camosun_id].upcase)
    if user
      log_in user
      redirect_login
    else
      # create an error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  private
  
  def redirect_login
    if logged_in?
      if current_user.instructor?
        redirect_to manage_requests_path
      elsif current_user.student?
        redirect_to new_request_path
      end
    end
  end
  
end