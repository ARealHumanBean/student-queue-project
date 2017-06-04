class RequestsController < ApplicationController
  before_action :require_instructor, :only=>[:index]
  before_action :require_student, :only=>[:new, :create]
  def new 
    if current_user.request
      redirect_to current_user.request
    end
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
    require_current_students_request
  end
  
  def destroy
    request = Request.find(params[:id]).destroy
    
    # redirect to user's profile unless user is an instructor at this point
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
      params.require(:request).permit(:queue_type, :info, :id)
    end
    
    # Redirect to new request for the current student if the request doesn't 
    # exist or request does not belong to the student. 
    def require_current_students_request
      if current_user.student?
        if !@request
          flash[:notice] = "The request does not exist yet!"
          redirect_to new_request_path
        elsif current_user.id != @request.user_id
          flash[:danger] = "You don't have access to that request!"
          redirect_back(fallback_location: new_request_path)
        end
      end
    end
end
