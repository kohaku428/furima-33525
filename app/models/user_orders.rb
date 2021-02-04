class UserOrders
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :region_id, :city, :house_number, :building_name, :telephone

  validates :city, :house_number, presence: true 
  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :region_id, numericality: { other_than: 1 }
  validates :telephone, presence: true,  format: { with: /\A\d{10}$|^\d{11}\z/ }

  def save
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name,)
    Order.create(user: user, item: item)
  end
end