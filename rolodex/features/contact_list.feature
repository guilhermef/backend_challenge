Feature: Contact list
  
  @selenium
  Scenario: See contacts in alphabetical order
    Given 15 contacts exist
    And I am on root
		Then 	I see all contacts in alphabetical order

	@selenium	
  Scenario: Add contact
    Given I am on root
    When I follow "New Contact"
		And I fill in "First name" with "Axl"
		And I fill in "Middle name" with "joe"
		And I fill in "Last name" with "Rose"
    When I follow "add number"
    # And I select "office" from "Phone type"
    And I fill in "Full number" with "(123)-123-4567"
    When I press "Create Contact"
    Then I should see "Contact was successfully created."
    And a contact should exist with first_name: "Axl", middle_name: "joe", last_name: "Rose"
    And a phone_number should exist with area_code: "123", number: "1234567"
    # And a phone_type should exist with name: "office"
    
  @selenium	
  Scenario: Show contact
    Given a contact "1" exists with first_name: "Axl", middle_name: "joe", last_name: "Rose"
    Given a phone_number "1" exists with area_code: "123", number: "1234567", contact: contact "1"
    Given a phone_number "2" exists with area_code: "123", number: "2314567", contact: contact "1"
    And I am on root
    When I follow "Axl Rose"
    Then I should see "Axl" info