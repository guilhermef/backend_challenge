# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :address do |f|
  f.association(:contact)
  f.address "Road to nowhere"
  f.zip "55416"
  f.city "Rio de Janeiro"
  f.state "Rio de Janeiro"
  f.country "Brasil"
  f.association(:address_type)
end
