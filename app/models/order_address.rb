class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :item_prefecture_id, :address, :house_number, :building_name, :phone_number,:item_id, :user_id

with_options presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} do
    validates :postal_code
   end
   
   with_options numericality: { other_than: 1, message: "Select"} do
  validates :item_prefecture_id
   end

   with_options presence: true do
    validates :address
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
   end

   with_options presence: true, format: {with: /\A\d{11}\z/, message:"Input only number"} do
  validates :phone_number
   end



def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: item_prefecture_id, address: address, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
   end

end