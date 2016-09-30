class ItemsController < ApplicationController
  before_action :set_item

  def show
  end

  def new
    @item = Item.new
    @item.list_id = params[:id]
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
  end

  def update
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
    def set_item
      @item = Item.find_by(id: params[:id])
    end

    # def set_pro_con
    #   if params[:pro_con] == "pro"
    #     params[:pro_con] == true
    #   elsif params[:pro_con] == "con"
    #     params[:pro_con] == false
    #   end
    # end

    def item_params
      params.require(:item).permit(:description, :weight, :pro_con, :id, :list_id)
    end

end
