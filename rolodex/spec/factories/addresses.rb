# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :address do |f|
  f.association(:contact)
  f.address "MyString"
  f.zip "55416"
  f.city "MyString"
  f.state "MyString"
  f.country "MyString"
  f.association(:address_type)
end
