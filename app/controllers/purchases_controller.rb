class PurchasesController < ApplicationController

  def index
    @destination_purchase = DestinationPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_purchase = DestinationPurchase.new(destination_purchase_params)
    if @destination_purchase.valid?
      pay_item
      @destination_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

private
def destination_purchase_params
  params.require(:destination_purchase).permit(:postal_code, :ship_form_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_id: params[:purchase_id], token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  
    card: destination_purchase_params[:token], 
    currency: 'jpy'      
  )
end

end
