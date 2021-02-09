class UserOrders
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :house_number, :building_name, :telephone, :token

  with_options presence: true do
  validates :token
  validates :city
  validates :house_number
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :telephone, format: { with: /\A\d{10}$|^\d{11}\z/ }
  end
  validates :region_id, numericality: { other_than: 1 }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name, order_id: order.id, telephone: telephone)
  end
end