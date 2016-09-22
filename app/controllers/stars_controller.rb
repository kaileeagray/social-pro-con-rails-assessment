class StarsController < ApplicationController
  before_action :logged_in_user

  def create
    list = List.find(params[:list_id])
    current_user.star(list)
    redirect_to list_path(list)
  end

  def destroy
    list = Star.find(params[:id]).list
    current_user.unstar(list)
    redirect_to list_path(list)
  end
end
