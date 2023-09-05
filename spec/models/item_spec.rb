require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '正常系' do
    it '正しい情報が入力されていればバリデーションが通ること' do
      expect(@item).to be_valid
    end
  end

  context '異常系' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
        @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.title = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it ' カテゴリーの情報が必須であること。' do
      @item.category = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態の情報が必須であること' do
      @item.condition = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '発送元の地域の情報が必須であること' do
      @item.prefecture = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '配送料の負担の情報が必須であること' do
      @item.shipping_fee_burden = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end

    it ' 発送までの日数の情報が必須であること' do
      @item.shipping_duration = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
    end

    it '価格の情報が必須であること' do
      @item.price = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が半角かつ３００円以上９９９９９９円以下であること' do
      @item.price = '299'
      @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '価格が半角かつ３００円以上９９９９９９円以下であること' do
      @item.price = '10_000_000'
      @item.valid?
    expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

    it '価格が半角以外保存できないこと' do
      @item.price = '１０００' 
  expect(@item).not_to be_valid
  expect(@item.errors.full_messages).to include("Price is out of setting range")
end
end
end