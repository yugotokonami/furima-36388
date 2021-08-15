require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id,)
    sleep(0.5)
  end

  context '内容に問題がない場合' do
    it '全ての値が正しく入力されていれば、保存できること' do
      expect(@order_address).to be_valid
    end
    it 'buildingは空でも登録できる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
    it 'postcodeは3桁ハイフン4桁なら登録できる' do
      @order_address.postcode = '123-4567'
      expect(@order_address).to be_valid
    end
    it 'postcodeは半角文字列なら登録できる' do
      @order_address.postcode = '123-4567'
      expect(@order_address).to be_valid
    end
    it 'phone_numberは10桁以上11桁以内なら登録できる' do
      @order_address.phone_number = 11111111111
      expect(@order_address).to be_valid
    end
    it 'phone_numberは半角数字なら登録できる' do
      @order_address.phone_number = 11111111111
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postcodeが空では登録できない' do
      @order_address.postcode = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'prefecture_idが空では登録できない' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1の場合は登録できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では登録できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空では登録できない' do
      @order_address.block = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end
    it 'phone_numberが空では登録できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'postcodeは3桁ハイフン4桁以外では登録できない' do
      @order_address.postcode = '1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it 'postcodeは半角文字列以外では登録できない' do
      @order_address.postcode = '12345678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
    end
    it 'phone_numberは10桁未満では登録できない' do
      @order_address.phone_number = 111111111
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end
    it 'phone_numberは11桁以上では登録できない' do
      @order_address.phone_number = 111111111111
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it 'phone_numberは半角数字以外では登録できない' do
      @order_address.phone_number = '１１１１１１１１１１'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number to include")
    end
  end
end
