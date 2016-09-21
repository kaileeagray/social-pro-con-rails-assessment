class ListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: [:destroy, :update]

  def show
    @list = List.find_by(id: params[:id])
  end

  def new
    @list = current_user.lists.build
  end

  def create
    store_location
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = "List created"
      redirect_to list_path(@list)
    else
      render 'lists/new'
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    if @list.destroy
      flash[:success] = "List destroyed"
    else
      flash[:danger] = "List not destroyed"
    end
    redirect_to root_url
  end

  private
    def list_params
      params.require(:list).permit(:title, :description)
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_url if @list.nil?
    end
end
