require 'rails_helper'

RSpec.describe UserOrders, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user_orders = FactoryBot.build(:user_orders)
    end

    context '購入情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_orders).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_orders.building_name = ''
        expect(@user_orders).to be_valid
      end
    end
    context '購入情報の保存ができないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @user_orders.postal_code = ''
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_orders.postal_code = '1234567'
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'region_idが1では保存できないこと' do
        @user_orders.region_id = 1
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include('Region must be other than 1')
      end
      it 'telephonが空だと保存できないこと' do
        @user_orders.telephone = ''
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephonがハイフンを含まない正しい形式でないと保存できないこと' do
        @user_orders.telephone = '000-0000-0000'
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include('Telephone is invalid')
      end
      it 'cityが空だと保存できないこと' do
        @user_orders.city = ''
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @user_orders.house_number = ''
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include("House number can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @user_orders.token = nil
        @user_orders.valid?
        expect(@user_orders.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
