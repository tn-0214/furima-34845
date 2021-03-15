require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  describe '#create' do
    before do
    user =  FactoryBot.create(:user)
    item =  FactoryBot.create(:item)
    sleep 0.5
    @destination_purchase = FactoryBot.build(:destination_purchase, user_id: user.id, item_id: item.id)
  end

  context '購入成功時' do
    it "全て規定通りに入力されていれば購入できること" do
      expect(@destination_purchase).to be_valid
    end
    it "-を含む8文字の入力で郵便番号が登録できること" do
      @destination_purchase.postal_code = "000-0000"
      expect(@destination_purchase).to be_valid
    end
    
    it "数値のみの11桁で電話番号が登録できること" do
      @destination_purchase.phone_number = "09012345678"
      expect(@destination_purchase).to be_valid
    end

    it "buildingが空でも購入できること" do
      @destination_purchase.building = ""
      expect(@destination_purchase).to be_valid
    end

  end

  context '購入失敗時' do

    it "tokenが空では登録できないこと" do
      @destination_purchase.token = nil
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空では登録できないこと" do
      @destination_purchase.postal_code =  "" 
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeに-が入っていないと登録できないこと" do
      @destination_purchase.postal_code = "00000000"
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Postal code 半角ハイフンを含めた7桁の数字を入力してください")
    end    

    it "ship_form_idが空では登録できないこと" do
      @destination_purchase.ship_form_id = nil
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Ship form can't be blank")
    end

    it "ship_form_idが1では登録できないこと" do
      @destination_purchase.ship_form_id = 1
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Ship form must be other than 1")
    end

    it "cityが空では登録ができないこと" do
      @destination_purchase.city = ""
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空では登録ができないこと" do
      @destination_purchase.address = ""
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Address can't be blank")
    end

    it "電話番号が空では登録ができないこと" do
      @destination_purchase.phone_number = ""
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が全角を含むと登録ができないこと" do
      @destination_purchase.phone_number = "0あ000000000"
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Phone number 11桁の半角数字で入力してください")
    end

    it "電話番号に英字を含むと登録ができないこと" do
      @destination_purchase.phone_number = "0A000000000"
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Phone number 11桁の半角数字で入力してください")
    end

    it "user_idが空だと登録ができないこと" do
      @destination_purchase.user_id = nil
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("User can't be blank")
    end

    it "item_idが空だと登録ができないこと" do
      @destination_purchase.item_id = nil
      @destination_purchase.valid?
      expect(@destination_purchase.errors.full_messages).to include("Item can't be blank")
    end
  end
  end
end
