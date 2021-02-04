class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :region
  belongs_to :day
  belongs_to :user
  has_one :order
  validates :description, :item_name, :image, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' }
  validates :category_id, :condition_id, :cost_id, :region_id,
            :day_id, numericality: { other_than: 1 }
end
