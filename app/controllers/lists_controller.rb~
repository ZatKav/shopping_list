class ListsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :index, :new]
  before_filter :admin_user, only: [:index]

  def new
    @list = List.new
  end

  def index
    @lists = List.paginate(page: params[:page])
  end

  def create
    @list = current_user.lists.build(params[:list])
    if @list.save
      flash[:success] = "List created!"
      redirect_to list_path(params[:id])
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items.paginate(page: params[:page])
    @item = Item.new
  end

  def destroy
    @list.destroy
    redirect_to users_url
  end

  private

    def correct_user
      @list = current_user.lists.find_by_id(params[:id])
    rescue
      redirect_to root_url
    end
end

