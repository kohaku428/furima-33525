class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :region
  belongs_to :day

  validates :description, :items_name, :price, :image, presence: true
  validates :category_id, :condition_id, :cost_id, :region_id,
  :day_id, numericality: { other_than: 1 }
end
