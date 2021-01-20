require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
  @order_address = FactoryBot.build(:order_address)
 end

describe '購入画面' do
 it "すべての値が正しく入力されていれば購入できる" do
  expect(@order_address).to be_valid
 end
 
 it "postal_codeが空だと購入できない" do
  @order_address.postal_code = ""
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
 end
 
 it "postal_codeには -(ハイフン)が入ってないと購入できない" do
  @order_address.postal_code = "1234567"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
end
 
 it "item_prefecture_idが空では購入できない" do
  @order_address.item_prefecture_id = ""
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Item prefecture Select")
 end

it "item_prefecture_idの1番を選択すると購入できない" do
  @order_address.item_prefecture_id = "1"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Item prefecture Select")
 end
 
it "category_idの1番を選択すると購入できない" do
  @order_address.item_prefecture_id = "1"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Item prefecture Select")
 end

it "addressが空だと購入できない" do
  @order_address.address = ""
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Address can't be blank")
 end

it "house_numberが空だと購入できない" do
  @order_address.house_number = ""
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("House number can't be blank")
 end

it "phone_numberが空だと購入できない" do
  @order_address.phone_number = ""
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
 end

it "phone_numberが11桁以内なら登録できる" do
  @order_address.phone_number = "11111111111"
   expect(@order_address).to be_valid
 end

it "phone_numberが12桁以上であれば購入できない" do
  @order_address.phone_number = "111111111111"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Phone number Input only number")
 end

it "phone_numberに -(ハイフン)が入ると購入できない" do
  @order_address.phone_number = "111-111-111"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Phone number Input only number")
 end

it "tokenが空だと購入できない" do
  @order_address.token = ""
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include("Token can't be blank")
 end
 end
end