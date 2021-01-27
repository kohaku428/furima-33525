FactoryBot.define do
  factory :item do
    category_id {2}   
    condition_id {2} 
    cost_id {2}      
    region_id {2}    
    day_id {2}      
    price {330}        
    item_name {'aaa'}     
    description {'aaaaaaaaa'}
    association :user  
  
  after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
