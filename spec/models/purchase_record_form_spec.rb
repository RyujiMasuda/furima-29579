require 'rails_helper'
describe PurchaseRecordForm do
  before do
    @buyer = FactoryBot.create(:user)
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @purchase_record_form = FactoryBot.build(:purchase_record_form, user_id: @buyer.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "user,itemと紐づいていて, prefecture_id, municipality, street, building, post, phoneが存在すれば登録できる" do
        expect(@purchase_record_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "ユーザーと紐づいていないと登録できない" do
        @purchase_record_form.user_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("User can't be blank")
      end
      it "itemと紐づいていないと登録できない" do
        @purchase_record_form.item_id = nil
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Item can't be blank")
      end
      it "prefecture_idが空では登録できない" do
        @purchase_record_form.prefecture_id = ""
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Prefecture can't be blank", "Prefecture can't be blank")
      end
      it "municipalityが空では登録できない" do
        @purchase_record_form.municipality = ""
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it "streetが空では登録できない" do
        @purchase_record_form.street = ""
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Street can't be blank")
      end
      it "postが空では登録できない" do
        @purchase_record_form.post = ""
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Post can't be blank")
      end
      it "postにはハイフンが必要なこと" do
        @purchase_record_form.post = "1234567"
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Post is invalid. Include hyphen(-)")
      end
      it "phoneが空では登録できない" do
        @purchase_record_form.phone = ""
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone can't be blank")
      end
      it "phoneにハイフンがあると登録できない" do
        @purchase_record_form.phone = "080-4387-3210"
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone is invalid")
      end
      it "phoneは11桁以内であること" do
        @purchase_record_form.phone = "080438732100"
        @purchase_record_form.valid?
        expect(@purchase_record_form.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end