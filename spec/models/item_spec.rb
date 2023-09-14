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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it '商品名が必須であること' do
      @item.title = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it ' カテゴリーの情報が必須であること。' do
      @item.category_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end

    it '商品の状態の情報が必須であること' do
      @item.condition_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end

    it '発送元の地域の情報が必須であること' do
      @item.prefecture_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end

    it '配送料の負担の情報が必須であること' do
      @item.shipping_fee_burden_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("発送料の負担を選択してください")
    end

    it ' 発送までの日数の情報が必須であること' do
      @item.shipping_duration_id = 1
      @item.valid?
    expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end

    it '価格の情報が必須であること' do
      @item.price = nil
      @item.valid?
    expect(@item.errors.full_messages).to include("金額を入力してください", "金額が設定範囲外です")
    end
    it '価格が半角かつ３００円以上９９９９９９円以下であること' do
      @item.price = '299'
      @item.valid?
    expect(@item.errors.full_messages).to include("金額が設定範囲外です")
    end

    it '価格が半角かつ３００円以上９９９９９９円以下であること' do
      @item.price = '10_000_000'
      @item.valid?
    expect(@item.errors.full_messages).to include("金額が設定範囲外です")
    end

    it '価格が半角以外保存できないこと' do
      @item.price = '１０００' 
      @item.valid?
  expect(@item.errors.full_messages).to include("金額が設定範囲外です")
end
it 'ユーザーが関連付けられていない場合、保存できない' do
  @item.user = nil 
  @item.valid?
  expect(@item.errors.full_messages).to include("Userを入力してください")
end
end
end