class ListsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :update, :index]
  before_action :correct_user,   only: [:destroy, :update]

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

    @list = current_user.lists.build(title: params["list"]["title"], description: params["list"]["description"])
    @list.save

    list_params["items_attributes"].values.each do |item|
      @list.items.create!(item) unless item["description"].empty?
    end if list_params["items_attributes"]

    if @list.errors.empty?
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
    @pros = @list.pros
    @cons = @list.cons
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
      params.require(:list).permit(:title, :description, items_attributes: [:description, :weight, :pro_con, :user_id])
    end

    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_url if @list.nil?
    end
end
