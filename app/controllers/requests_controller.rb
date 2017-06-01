class RequestsController < ApplicationController
  def new 
    @request = Request.new
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
    request = Request.find(params[:id]).destroy
    
    # redirect to user's profile unless user is an instructor
    unless current_user.instructor?
      redirect_to user_url and return
    end
    
    # redirect to the selected queue in the manage requests view
    redirect_to requests_url(queue_type: request.queue_type)
    flash[:success] = "Request Completed"
  end
  
  def create 
    # Create request belonging to the current user
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to @request
    else
      render 'new'
    end
  end
  
  def edit  
  end
  
  private
    def request_params
      params.require(:request).permit(:queue_type, :info)
    end
end
