require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が正常であれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに一意性がないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは、@を含む必要があること' do
      @user.email = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordがない場合は登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'yamada090'
      @user.password_confirmation = 'yamada090'
      expect(@user).to be_valid
    end

    it 'passwordは、確認用を含めて2回入力すること' do
      @user.password = 'yamada090'
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank", "Password confirmation is invalid")
    end

    it 'passwordは、半角数字のみの場合は登録できない' do
      @user.password = '111111'      
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは、半角英字のみの場合は登録できない' do
      @user.password = 'aaaaaa'      
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordと確認用passwordの値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.last_name = '太郎'
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.last_name = nil
      @user.first_name = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'abc'
      @user.first_name = 'def'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid', 'Last name is invalid')
    end

    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.last_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid", "Last name kana can't be blank", "Last name kana is invalid")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name = 'ﾀﾛｳ'
      @user.first_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid', 'Last name is invalid')
    end

    it '生年月日が必須であること' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
