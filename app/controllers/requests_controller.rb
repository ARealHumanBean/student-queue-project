class RequestsController < ApplicationController
  def new 
  end
  
  # Manage Requests view
  def index
    @requests = Request.all
    @question = Request.question.all
    @demo = Request.demo.all
    @support = Request.support.all
  end
  
  def show
  end
  
  def destroy
  end
  
  def edit  
  end
end
