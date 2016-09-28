class ListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: [:destroy, :update]


  def show
    @list = List.find_by(id: params[:id])
    @owner_items_hash = @list.owner_items_hash
    @contributor_items_hash = @list.contributor_items_hash
  end

  def new
    @list = current_user.lists.build
    @pro = @list.items.build(pro_con: true)
    @con = @list.items.build(pro_con: false)
  end

  def create
    debugger
    store_location
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = "List created"
      redirect_to list_path(@list)
    else
      render 'lists/new'
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
    @pro = @list.items.build(pro_con: true)
    @con = @list.items.build(pro_con: false)
  end

  def update
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

  def starrers
    @title = "Starrers"
    @list = List.find(params[:id])
    @users = @list.starrers.paginate(page: params[:page])
    render 'shared/show_starrers'
  end

  private
    def list_params
      params.require(:list).permit(:title, :description, items_attributes: [:id, :name])
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_url if @list.nil?
    end
end
