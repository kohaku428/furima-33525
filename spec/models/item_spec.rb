require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品を出品できるとき' do
        it 'すべての項目の入力が存在すれば出品できる' do
          expect(@item).to be_valid
        end
      end
      context '商品を出品できないとき' do
        it 'item_nameが空では出品できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'imageが空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'category_idが1では出品できない' do
          @item.category_id= 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it 'condition_idが1では出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it 'cost_idが1では出品できない' do
          @item.cost_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost must be other than 1")
        end
        it 'region_idが1では出品できない' do
          @item.region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Region must be other than 1")
        end
        it 'day_idが1では出品できない' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Day must be other than 1")
        end
        it 'descriptionが空では出品できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'priceが空では出品できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      end
  end
end
