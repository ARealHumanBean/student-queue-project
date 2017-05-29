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
  end
  
  def destroy
    Request.find(params[:id]).destroy
    flash[:success] = "Request Completed"
    redirect_to requests_url
  end
  
  def edit  
  end
  
  private
    def request_params
      params.require(:request).permit(:queue_type)
    end
end
