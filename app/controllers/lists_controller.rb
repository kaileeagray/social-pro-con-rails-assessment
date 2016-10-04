class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:destroy, :edit, :update, :edit_access, :update_access]

  def index
    @feed_items = List.all.paginate(page: params[:page], :per_page => 10)
  end

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
    @list = current_user.lists.new(list_params)

    if @list.save
      flash[:success] = "List created"
      redirect_to list_path(@list)
    else
      render 'lists/new'
    end
  end

  def edit_access
    @list = List.find_by(id: params[:id])
    @starrers = @list.starrers
    @stars = @list.stars
    if @list.nil?
      redirect_to lists_path, alert: "List not found."
    end
    render 'grant_access'
  end

  def update_access
    @list = List.find(params[:id])
    @list.update_admins(list_params[:admin_ids])
    redirect_to list_path(@list)
  end

  def edit
    @list = List.find_by(id: params[:id])
    if @list.nil?
      redirect_to lists_path, alert: "List not found."
    end
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    if @list.save
      flash[:info] = "List updated."
      redirect_to list_path(@list)
    else
      flash[:danger] = "invalid. Try again."
      render 'edit'
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

  def starrers
    @title = "Starrers"
    @list = List.find(params[:id])
    @users = @list.starrers.paginate(page: params[:page])
    render 'shared/show_starrers'
  end

  private
    def list_params
      params.require(:list).permit(:title, :description, items_attributes: [:user_id, :description, :weight, :pro_con, :id], 'admin_ids' => [])
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      if @list.nil?
        flash[:danger] = "You do not have proper permissions!"
        redirect_to root_url
      end
    end
end
