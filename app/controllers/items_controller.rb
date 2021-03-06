class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:show, :new, :create, :index, :destroy]
 # before_filter :admin_user, only: [:destroy]

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item =Item.new
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:success] = "Item created"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def index
    @items = Item.paginate(page: params[:page])
  end

  def destroy
    @item.destroy
    flash[:success] = "Item destroyed."
    redirect_to items_path
  end
end

