class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]

  def index
    @purchase_record_form = PurchaseRecordForm.new
    @item = Item.find(params[:item_id])
    if @item.purchase_record != nil || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new(purchase_record_form_params)
    if @purchase_record_form.valid?
      pay_item
      @purchase_record_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_form_params
    params.require(:purchase_record_form).permit(
      :purchase_record, 
      :prefecture_id, 
      :municipality, 
      :street, 
      :building, 
      :post, 
      :phone, 
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_record_form_params[:token],
        currency: 'jpy'
      )
  end

end
