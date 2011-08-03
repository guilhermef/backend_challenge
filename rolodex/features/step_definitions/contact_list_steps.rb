Then /^I see all contacts in alphabetical order$/ do
  Contact.order(:first_name).each_with_index do |contact, i|
    page.should have_xpath("//div[@id='contacts']//div[#{i +1}]//a[contains(text(),'#{contact.first_name} #{contact.last_name}')]")
  end
end

Then /^I should see "([^"]*)" info$/ do |first_name|
  c = Contact.find_by_first_name(first_name)
  page.should have_content(c.middle_name)
  c.phone_numbers.each{|n| page.should have_content(n.full_number)}
end