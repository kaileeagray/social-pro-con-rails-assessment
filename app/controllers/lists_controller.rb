class ListsController < ApplicationController

  def show
    @list = List.find_by(id: params[:id])
  end

end
