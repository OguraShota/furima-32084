class PurchaseRecordsController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create

  end

  private

  def purchase_record_params
    params.require(:order_address).permit(:postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number )
  end

end
