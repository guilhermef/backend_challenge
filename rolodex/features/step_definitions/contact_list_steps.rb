Then /^I see all contacts in alphabetical order$/ do
  Contact.order(:first_name).each_with_index do |contact, i|
    page.should have_xpath("//div[@id='contacts']//span[#{i +1}]//a[text()='#{contact.first_name}']")
  end
end