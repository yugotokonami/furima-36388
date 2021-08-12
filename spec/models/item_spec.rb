require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品が上手く行くとき' do
      it 'image、name、catch_copy、category_id、state_id、postage_id、prefecture_id、shipping_date_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceは¥300~¥9,999,999の間のみ登録できる' do
        @item.price = '500'
        expect(@item).to be_valid
      end
      it 'priceは半角数字であれば登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context '商品出品が上手く行かないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'catch_copyが空では登録できない' do
        @item.catch_copy = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Catch copy can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1の場合は登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'state_idが空では登録できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'state_idが1の場合は登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'postage_idが1の場合は登録できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1の場合は登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'shipping_date_idが1の場合は登録できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは¥300~¥9,999,999以外では登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間を設定してください")
      end
      it 'priceは半角数字以外では登録できない' do
        @item.price = '111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間を設定してください")
      end
      it 'priceが英字の場合は登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間を設定してください")
      end
      it 'priceが英数字混合の場合は登録できない' do
        @item.price = '11a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間を設定してください")
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end