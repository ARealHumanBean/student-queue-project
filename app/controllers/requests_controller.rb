class RequestsController < ApplicationController
  def new 
  end
  
  # Manage Requests view
  def index
    queue_type = params[:queue_type]
    
    if queue_type == "demo"
      @requests = Request.demo
    elsif queue_type == "support"
      @requests = Request.support
    else
      @requests = Request.question
    end
  end
  
  def show
    @request = Request.find_by(id: params[:id])
  end
  
  def destroy
    Request.find(params[:id]).destroy
    flash[:success] = "Request Completed"
    if current_user.student
      redirect_to user_url
    elsif current_user.instructor
      redirect_to requests_url
    end
  end
  
  def edit  
  end
  
  private
    def request_params
      params.require(:request).permit(:queue_type, :id)
    end
end
