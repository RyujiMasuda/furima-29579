class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(
      :name, 
      :category_id, 
      :condition_id, 
      :text, 
      :prefecture_id, 
      :day_id, 
      :delivery_fee_id, 
      :price, 
      :image
    ).merge(user_id: current_user.id)
  end

end