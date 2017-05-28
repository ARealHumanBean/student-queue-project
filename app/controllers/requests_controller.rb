class RequestsController < ApplicationController
  def new 
  end
  
  # Manage Requests view
  def index
    #TO DO: 
    # - Use render action to show the specific question/demo/support queue
    
    @requests = Request.all
    @question = Request.question
    @demo = Request.demo
    @support = Request.support
  end
  
  def show
  end
  
  def destroy
  end
  
  def edit  
  end
end
