class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    else
      redirect_to root_path
    end 
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(purchase_record_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_record_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
