class PurchaseRecordsController < ApplicationController

  def index
    @purchase_record_form = PurchaseRecordForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_form = PurchaseRecordForm.new(purchase_record_form_params)
    if @purchase_record_form.valid?
      @purchase_record_form.save
      redirect_to root_path
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
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
