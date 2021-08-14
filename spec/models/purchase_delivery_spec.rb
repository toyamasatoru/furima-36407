require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
  end

  describe '購入機能' do
    context '購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @purchase_delivery.postal_code = '1111111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'cityが空では購入できない' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空では購入できない' do
        @purchase_delivery.phone = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが半角数字でないと購入できない' do
        @purchase_delivery.phone = '1a1a1a1a1a1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'delivery_areaが空では購入できない' do
        @purchase_delivery.delivery_area = '0'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Delivery area can't be blank")
      end
      it "item_idが空では購入できない" do
        @purchase_delivery.item_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが空では購入できない" do
        @purchase_delivery.user_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end
      it "tokenが空では購入できない" do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '購入できるとき' do
      it "全てあれば登録できる" do
        expect(@purchase_delivery).to be_valid
      end
      it "buildingがなくとも登録できる" do
        @purchase_delivery.building = ''
        expect(@purchase_delivery).to be_valid
      end
    end
  end
end
