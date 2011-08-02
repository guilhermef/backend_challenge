# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :contact do |f|
  f.sequence(:first_name){|n| "name#{n}"}
  f.middle_name "MyString"
  f.last_name "MyString"
end
