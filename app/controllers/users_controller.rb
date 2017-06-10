class UsersController < ApplicationController
  
  before_action :require_instructor, :except=>[:show]
  def new
    @user = User.new
  end
  
  def index
  end
  
  def create
  end
  

  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
  end
  
  def import 
    User.import(params[:class_list])
    flash[:notice] = "Class list imported!"
    redirect_to manage_requests_path
  end
end
