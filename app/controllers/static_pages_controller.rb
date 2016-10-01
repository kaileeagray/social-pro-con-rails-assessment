class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @list = current_user.lists.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
    end
  end

  def help
  end

  def about
  end

end
