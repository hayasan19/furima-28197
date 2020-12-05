require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録' do
    context '登録がうまくいくとき' do
      it "nameとtext、とcategory_id、item_status_id、item_fee_status_id、item_prefecture_id、item_scheduled_delivery_id、priceが存在すれば登録できること" do
        expect(@item).to be_valid
      end
      
      it "nameが40文字以内なら登録できる" do
        @item.name = "a"*40
        expect(@item).to be_valid
      end

      it "textが1000文字以内なら登録できる" do
        @item.text = "a"*1000
        expect(@item).to be_valid
      end

      it "priceが半角数字であれば登録できる" do
       @item.price = "55555"
       expect(@item).to be_valid
      end

      context '登録がうまくいかないとき' do

      it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end  

      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "nameが41文字以上だと登録できない" do
       @item.name = "a"*41
       @item.valid?
       expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it "textが空では登録できない" do
       @item.text = ""
       @item.valid?
       expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "textが1001文字以上だと登録できない" do
      @item.text = "a"*1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end

      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "category_idの1番を選択すると登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "item_status_idが空では登録できない" do
        @item.item_status_id = ""
        @item.valid?
       expect(@item.errors.full_messages).to include("Item status Select")
      end

      it "item_status_idの1番を選択すると登録できない" do
        @item.item_status_id = "1"
        @item.valid?
       expect(@item.errors.full_messages).to include("Item status Select")
      end

      it "item_fee_status_idが空では登録できない" do
        @item.item_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item fee status Select")
      end

      it "item_fee_status_idの1番を選択すると登録できない" do
        @item.item_fee_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item fee status Select")
      end

      it "item_prefecture_idが空では登録できない" do
        @item.item_prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture Select")
      end

      it "item_prefecture_idの1番を選択すると登録できない" do
        @item.item_prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture Select")
      end

      it "item_prefecture_idの1番を選択すると登録できない" do
        @item.item_scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery Select")
      end

      it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "299以下の数字は登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "10000000以上の数字は登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    end
  end
  end
end




