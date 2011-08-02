# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :phone_number do |f|
  f.association :contact
  f.sequence(:area_code){|n| "#{n + 100}"}
  f.sequence(:number){|n| "2222#{n + 100}"}
  f.association :phone_type
end
