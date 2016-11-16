class ItemsController < ApplicationController
  before_action :correct_user,   only: [:destroy, :edit, :update]
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]

  def new
    @item = Item.new
    @item.list_id = params[:list_id]
    @item.pro_con = params[:item_type]
  end

  def show
    @item = Item.find_by(id: params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @item}
    end
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    @item.user = current_user
    if @item.save
      respond_to do |f|
        f.html {redirect_to list_path(@list)}
        f.json {render :json => @list}
      end
    else
      render "lists/show"
    end
  end


  def edit
    if params[:list_id]
      list = List.find_by(id: params[:list_id])
      if list.nil?
        redirect_to lists_path, alert: "List not found."
      else
        @item = list.items.find_by(id: params[:id])
        redirect_to list_items_path(list), alert: "Item not found." if @item.nil?
      end
    else
      @item = Item.find(params[:id])
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:info] = "Item updated."
      redirect_to list_path(@item.list)
    else
      flash[:danger] = "Item invalid. Try again."
      render 'edit'
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @list = @item.list
    if  @item.destroy
      flash[:success] = "item destroyed"
    else
      flash[:danger] = "item not destroyed"
    end
    redirect_to list_path(@list)
  end

  private

    def item_params
      params.require(:item).permit(:description, :weight, :pro_con, :id, :list_id)
    end

    def correct_user
      @item = Item.find_by(id: params[:id])
      unless !!current_user.items.includes(@item) || @item.list.user == current_user || @item.list.admin?(current_user)
        flash[:danger] = "You do not have proper permissions!"
        redirect_to root_url
      end
    end


end
