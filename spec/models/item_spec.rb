require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:valid_item) { build(:item) }

  context 'with valid attributes' do
    it 'is valid' do
      expect(valid_item).to be_valid
    end
  end

  context 'with missing required fields' do
    it 'is invalid without an image' do
      invalid_item = build(:item, image: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:image]).to include("can't be blank")
    end

    it 'is invalid without a title' do
      invalid_item = build(:item, title: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      invalid_item = build(:item, description: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a category' do
      invalid_item = build(:item, category: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:category]).to include("can't be blank")
    end

    it 'is invalid without a condition' do
      invalid_item = build(:item, condition: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:condition]).to include("can't be blank")
    end

    it 'is invalid without a shipping_fee_burden' do
      invalid_item = build(:item, shipping_fee_burden: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:shipping_fee_burden]).to include("can't be blank")
    end

    it 'is invalid without a shipping_duration' do
      invalid_item = build(:item, shipping_duration: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:shipping_duration]).to include("can't be blank")
    end

    it 'is invalid without a price' do
      invalid_item = build(:item, price: nil)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:price]).to include("Price can't be blank")
    end

  context 'with price out of range' do
    it 'is invalid with a price less than 300' do
      invalid_item = build(:item, price: 299)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:price]).to include("Price is out of setting range")
    end

    it 'is invalid with a price greater than 9,999,999' do
      invalid_item = build(:item, price: 10_000_000)
      expect(invalid_item).not_to be_valid
      expect(invalid_item.errors[:price]).to include("Price is out of setting range")
    end

