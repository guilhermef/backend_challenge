%w(joão Augusto Manuel Joaquim Tessália Joana Maria Alejo).each do |name|
  contact = Factory(:contact, 
          :first_name => name,
          :middle_name => "something",
          :last_name => "Doe", 
          :phone_numbers => [Factory(:phone_number), Factory(:phone_number), Factory(:phone_number)])
  10.times do 
    Factory(:address, :contact => contact)
    Factory(:phone_number, :contact => contact)
  end
end