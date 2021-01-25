class Day < ActiveHash::Base
  self.data = [
    { id: 1, cost: '---' },
    { id: 2, cost: '１~２日で発送' },
    { id: 3, cost: '２~３日で発送' },
    { id: 4, cost: '４~７日で発送' },
  ]
  include ActiveHash::Associations
  has_many :items
end
