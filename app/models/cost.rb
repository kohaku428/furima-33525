class Cost < ActiveHash::Base
  self.data = [
    { id: 1, cost: '---' },
    { id: 2, cost: '着払い（購入者負担）' },
    { id: 3, cost: '配送料込み（出品者負担）' }
  ]
  include ActiveHash::Associations
  has_many :items
end
