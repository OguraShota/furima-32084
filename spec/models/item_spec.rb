require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空だと保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーを選択していないと保存できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category select')
    end

    it '商品の状態について選択がないと保存できない' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition select')
    end

    it '配送料の負担について選択がないと保存できない' do
      @item.postage_type_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage type select')
    end

    it '発送元の地域について選択がないと保存できない' do
      @item.ship_from_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship from select')
    end

    it '発送までの日数について選択がないと保存できない' do
      @item.preparation_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Preparation day select')
    end

    it '価格についての情報が空だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が299以下だと出品登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '価格が10,000,000以上だと出品登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

  end
end
