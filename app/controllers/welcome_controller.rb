class WelcomeController < ApplicationController
  skip_before_action :require_login
  def index
    render :layout => false
  end
end
