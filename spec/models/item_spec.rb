require 'rails_helper'

RSpec.describe Item , type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品成功時' do
      it '全て規定通り入力されていれば出品できる' do
        expect(@item).to be_valid
      end

      it 'priceが300円以上なら登録できること' do
        @item.price = 301
        expect(@item).to be_valid
      end
    end

    
    context 'エラー発生時' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'commentが空では登録できないこと' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが空では登録できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end

      it 'condition_idが1では登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'postage_idが空では登録できないこと' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank", "Postage is not a number")
      end

      it 'postage_idが1では登録できないこと' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it 'ship_form_idが空では登録できないこと' do
        @item.ship_form_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form can't be blank", "Ship form is not a number")
      end

      it 'ship_form_idが1では登録できないこと' do
        @item.ship_form_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship form must be other than 1")
      end

      it 'etd_idが空では登録できないこと' do
        @item.etd_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Etd can't be blank", "Etd is not a number")
      end

      it 'etd_idが1では登録できないこと' do
        @item.etd_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Etd must be other than 1")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price 半角数字を使用してください")
      end

      it 'priceが300未満では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが10000000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceに全角が含まれると登録できないこと' do
        @item.price = '400あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end

      it 'priceに記号が含まれると登録できないこと' do
        @item.price = '400!'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end

      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end

      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end