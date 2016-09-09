class DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    if current_user.admin == true
      redirect_to "/admin"
    else
      @user = current_user
    end
  end


end
