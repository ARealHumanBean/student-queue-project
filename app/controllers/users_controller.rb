require 'csv'
class UsersController < ApplicationController
  before_action :require_instructor, :except=>[:show]
  def new
  end
  
  def index
  end
  
  def create
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    CSV.foreach(class_list, :headers => true) do |row|
      User.create!(row.to_hash)
    end
  end
  
  def destroy
  end
end
