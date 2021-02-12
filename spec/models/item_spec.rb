require 'rails_helper'
describe User do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it "userと紐づいていて, name, text, category_id, condition_id, prefecture_id, day_id, delivery_fee_id, priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ユーザーと紐づいていないと登録できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
      end
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字でなければ登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300以下だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999以上だと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1の時は登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category select")
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idが1の時は登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition select")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "prefecture_idが1の時は登録できない" do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture select")
      end
      it "day_idが空では登録できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "day_idが1の時は登録できない" do
        @item.day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day select")
      end
      it "delivery_fee_idが空では登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_fee_idが1の時は登録できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee select")
      end
    end
  end
end