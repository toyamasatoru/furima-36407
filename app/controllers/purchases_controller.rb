class PurchasesController < ApplicationController

  def index
    @purchase_delivery = PurchaseDelivery.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_delivery.valid?
       pay_item
       @purchase_delivery.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :delivery_area, :city, :address, :building, :phone, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
