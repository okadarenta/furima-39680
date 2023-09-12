require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  it 'バリデーションを通過すると保存できる' do
    expect(@purchase_form).to be_valid
  end

  it '郵便番号が必須であること' do
    @purchase_form.postal_code = nil
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
  end

  it '郵便番号が「3桁ハイフン4桁」の半角文字列のみ保存可能であること' do
    @purchase_form.postal_code = '1234567'
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
  end

  it '都道府県が必須であること' do
    @purchase_form.prefecture_id = nil
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'prefecture_idが「1」の場合（「--」のとき）では登録できないこと' do
    @purchase_form.prefecture_id = 1
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it '市区町村が必須であること' do
    @purchase_form.city = nil
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("City can't be blank")
  end

  it '番地が必須であること' do
    @purchase_form.street_address = nil
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Street address can't be blank")
  end

  it '建物名は任意であること' do
    @purchase_form.building_name = nil
    expect(@purchase_form).to be_valid
  end

  it '電話番号が必須であること' do
    @purchase_form.phone_number = nil
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
  end

  it '電話番号は10桁以上11桁以内の半角数値のみ保存可能であること' do
    @purchase_form.phone_number = '090-1234-5678'
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
  end

  it "tokenが空では登録できないこと" do
    @purchase_form.token = nil
    @purchase_form.valid?
    expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
  end
end