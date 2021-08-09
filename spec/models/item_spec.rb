require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'informationが空では出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'category_idが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが空では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_area_idが空では出品できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'delivery_schedule_idが空では出品できない' do
        @item.delivery_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery schedule must be other than 1")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '五百円'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが299以下は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが100000000以上は出品できない' do
        @item.price = 100000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
