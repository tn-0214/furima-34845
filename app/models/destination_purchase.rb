class DestinationPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_form_id, :city, :address, :building, :phone_number, :user_id, :item_id ,:purchase_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角ハイフンを含めた7桁の数字を入力してください"}
    validates :ship_form_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "11桁の半角数字で入力してください"}
    validates :token
  end


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Destination.create(postal_code: postal_code, ship_form_id: ship_form_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)

  end
end