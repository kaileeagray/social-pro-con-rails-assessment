class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @list = current_user.lists.build
      @feed_items = List.all.paginate(page: params[:page], :per_page => 10)
    end
  end

  def help
  end

  def about
  end

end
