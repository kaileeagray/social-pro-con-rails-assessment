class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.list_id = params[:list_id]
    @item.pro_con = params[:item_type]
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      flash[:info] = "Item added to list."
      redirect_to list_path(@item.list)
    else
      flash[:danger] = "Item invalid. Try again."
      render 'new'
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
    debugger
    @item = Item.update(item_params)
    if @item.save
      flash[:info] = "Item udpated."
      redirect_to list_path(@item.list)
    else
      flash[:danger] = "Item invalid. Try again."
      render 'new'
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

    def load_list
      @list = List.find(params[:list_id])
    end

    def item_params
      params.require(:item).permit(:description, :weight, :pro_con, :id, :list_id)
    end


end
