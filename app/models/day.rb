class Day < ActiveHash::Base
  self.data = [
    { id: 1, day: '---' },
    { id: 2, day: '１~２日で発送' },
    { id: 3, day: '２~３日で発送' },
    { id: 4, day: '４~７日で発送' },
  ]
  include ActiveHash::Associations
  has_many :items
end
