class UsersController < ApplicationController
  before_action :authenticate_user!,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :feed]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists.paginate(page: params[:page], :per_page => 10)
  end

  def starred
    @user = User.find(params[:id])
    @lists = @user.starred.paginate(page: params[:page])
    render 'shared/show_starred'
  end

  def feed
    @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 10)
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
