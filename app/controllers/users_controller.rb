class UsersController < ApplicationController
  
  before_action :require_instructor, :except=>[:show]
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
  end
  
  def create
  end
  

  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def destroy
    if user = User.find_by(id: params[:id])
      user.destroy 
    end
    redirect_to :back
  end
  
  def destroy_all
    User.destroy_all(:role => "student")
    flash[:notice] = "You have removed all results!"
    redirect_to :back
  end
  
  def import 
    User.import(params[:class_list])
    flash[:notice] = "Class list imported!"
    redirect_to manage_users_path
  end
end
