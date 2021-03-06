class RequestsController < ApplicationController
  before_action :require_instructor, :only=>[
    :index, :destroy_all, :destroy_all_current_type
  ]
  before_action :require_student, :only=>[:new, :create]
  
  def new 
    if current_user.request
      redirect_to current_user.request
    end
    @request = Request.new
  end
  
  # Manage Requests view
  def index
    set_queue_type
    @requests = Request.where(queue_type: @queue_type)
    
    if @requests.empty? 
      flash[:danger] = "No requests for #{@queue_type} are submitted"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    if Request.exists?(id: params[:id])
      @request = Request.find_by(id: params[:id])
      require_current_students_request
    else 
      flash[:danger] = "Request does not exist"
      redirect_default_page
    end
  end
  
  def destroy
    if request = Request.find_by(id: params[:id])
      request.destroy 
    end
    
    # redirect to user's profile unless user is an instructor at this point
    unless current_user.instructor?
      redirect_to new_request_path and return
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
  
  def destroy_all
    Request.destroy_all
  end
  
  def destroy_all_current_queue_type
    set_queue_type
    Request.where(queue_type: @queue_type).destroy_all
  end
  
  private
    def request_params
      params.require(:request).permit(:queue_type, :info, :id)
    end
    
    # Redirect to a new request if user is a student, and they're accessing a 
    # request which doesn't belong to them
    def require_current_students_request
      if current_user.student?
        unless current_user.id == @request.user_id
          flash[:danger] = "You don't have access to that request!"
          redirect_back(fallback_location: new_request_path)
        end
      end
    end
    
    def set_queue_type
      @queue_type = params[:queue_type]
      unless ["question", "support", "demo"].include?(@queue_type)
        @queue_type = "question"
      end
    end
end
