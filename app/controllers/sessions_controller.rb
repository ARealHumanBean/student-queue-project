class SessionsController < ApplicationController
  skip_before_action :require_login, :only=>[:new, :create]
  before_action :require_logged_out, :only=>[:new, :create]
  
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
  
  def require_logged_out
    if logged_in?
      if current_user.instructor?
        redirect_to requests_url
      elsif current_user.student?
        redirect_to requests/new
      end
    end
  end
  
end