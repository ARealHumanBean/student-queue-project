class RequestsController < ApplicationController
  def new 
  end
  
  # Manage Requests view
  def index
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
