class StarsController < ApplicationController
  before_action :authenticate_user!

  def create
    list = List.find(params[:list_id])
    if list.user == current_user
      flash[:danger] = "Can't star your own list"
    else
      current_user.star(list)
    end
    redirect_to list_path(list)
  end

  def destroy
    list = Star.find(params[:id]).list
    if list.user == current_user
      flash[:danger] = "Can't unstar your own list"
    else
      current_user.unstar(list)
    end
    redirect_to list_path(list)
  end

end
