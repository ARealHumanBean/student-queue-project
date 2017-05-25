class UsersController < ApplicationController
  def new
  end
  
  def index
  end
  
  def create
    @user = User.new(params[])
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
  end
end
