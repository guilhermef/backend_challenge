# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :contact do |f|
  f.sequence(:first_name){|n| "first_name#{n}"}
  f.middle_name "MyString"
  f.sequence(:last_name){|n| "last_name#{n}"}
end
