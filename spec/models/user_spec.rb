require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手く行くとき' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは6文字以上の半角英数字混合あれば登録できる' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaa'
        expect(@user).to be_valid
      end
      it 'first_nameは全角文字であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_nameは全角文字であれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_name_kanaは全角カナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'last_name_kanaは全角カナであれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
    end

    context '新規登録が上手くいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end
    end
  end
end
