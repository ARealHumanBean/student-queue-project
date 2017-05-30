class SessionsController < ApplicationController
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
  end
end
