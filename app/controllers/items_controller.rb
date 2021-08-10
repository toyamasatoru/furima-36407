class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:create, :show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

# 以下コメントアウトは、安心要素としてLGTM確認後に削除します。
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
    # unless @item.user_id == current_user.id
    #   redirect_to action: :index
    # end
  end

  def update
    # @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end

  end

private

  def item_params
    params.require(:item).permit(:image, :name, :information, :category_id, :status_id, :postage_id, :delivery_area_id, :delivery_schedule_id, :price,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end
end
