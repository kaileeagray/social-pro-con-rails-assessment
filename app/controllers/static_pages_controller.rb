class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @list = current_user.lists.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
