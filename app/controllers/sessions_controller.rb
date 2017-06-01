class SessionsController < ApplicationController
  skip_before_action :require_login, :only=>[:new, :create]
  before_action :redirect_on_login, :only=>[:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(camosun_id: params[:session][:camosun_id].upcase)
    if user
      log_in user
      redirect_to user
    else
      # create an error message
      flash.now[:danger] = "invalid email/password combination"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  private
  
  def redirect_on_login
    if logged_in?
      if current_user.instructor?
        redirect_to requests_url
      elsif current_user.student?
        redirect_to new_request_path
      end
    end
  end
  
end