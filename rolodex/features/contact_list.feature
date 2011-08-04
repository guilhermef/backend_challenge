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
    When I follow "add address"
    And I fill in "Address" with "some street"
    And I fill in "Zip" with "12345"
    And I fill in "City" with "Rio de Janeiro"
    And I fill in "State" with "Rio de Janeiro"
    And I select "Brazil" from "Country"
    When I press "Create Contact"
    Then I should see "Contact was successfully created."
    And a contact should exist with first_name: "Axl", middle_name: "joe", last_name: "Rose"
    And a phone_number should exist with area_code: "123", number: "1234567"
    And a address should exist with address: "some street", zip: "12345", city: "Rio de Janeiro", state: "Rio de Janeiro", country: "Brazil"
    # And a phone_type should exist with name: "office"
    
  @selenium	
  Scenario: Show contact
    Given a contact "1" exists with first_name: "Axl", middle_name: "joe", last_name: "Rose"
    Given a phone_number "1" exists with area_code: "123", number: "1234567", contact: contact "1"
    Given a phone_number "2" exists with area_code: "123", number: "2314567", contact: contact "1"
    And I am on root
    When I follow "Axl Rose"
    Then I should see "Axl" info

  @selenium	
  Scenario: Search for a contact
    Given 15 contacts exist
    Given a contact exists with first_name: "Axl", middle_name: "joe", last_name: "Rose"
    Given a contact exists with first_name: "Johnny", last_name: "Knoxville"
    And I am on root
    And I fill in "search" with "John"
    Then I should not see "Axl Rose"
    And I should see "Johnny Knoxville"
    
	@selenium
  Scenario: Update contact
    Given 15 contacts exist
    Given a contact "1" exists with first_name: "Johnny", last_name: "Knoxville"
    Given a phone_number "1" exists with area_code: "123", number: "1234567", contact: contact "1"
    Given I am on root
    When I follow "Johnny Knoxville"
    When I follow "edit contact"
    And I fill in "First name" with "Axl"
    And I follow "remove number"
    When I press "Update Contact"
    Then I should see "Contact was successfully updated."
    And a contact should exist with first_name: "Axl", last_name: "Knoxville"
    And a phone_number should not exist with area_code: "123", number: "1234567"

  @selenium
  Scenario: Remove contact
    Given a contact "1" exists with first_name: "Johnny", last_name: "Knoxville"
    Given a phone_number "1" exists with area_code: "123", number: "1234567", contact: contact "1"
    Given I am on root
    When I follow "Johnny Knoxville"
    And I follow "delete contact"
    And I confirm
    Then I should not see "Johnny Knoxville"
    And a contact should not exist with first_name: "Johnny", last_name: "Knoxville"
    And a phone_number should not exist with area_code: "123", number: "1234567"
	
  @selenium
  Scenario: select and remove contacts
    Given a contact exists with id: 1, first_name: "Johnny", last_name: "Knoxville"
    Given a contact exists with id: 2, first_name: "Party", last_name: "Boy"
    Given a contact exists with id: 3, first_name: "Steve", last_name: "O"
    Given I am on root
    When I check "contact_2"
    And I check "contact_3"
    When I press "delete selected contacts"
    And I confirm
    Then I should see "Johnny Knoxville"
    And I should not see "Party Boy"
    And I should not see "Steve O"
    And a contact should not exist with id: 2, first_name: "Party", last_name: "Boy"
    And a contact should not exist with id: 3, first_name: "Steve", last_name: "O"
    
  @selenium
  Scenario: select from search and remove contacts
    Given a contact exists with id: 1, first_name: "Johnny", last_name: "Knoxville"
    Given a contact exists with id: 2, first_name: "Johnny", last_name: "Cash"
    Given a contact exists with id: 3, first_name: "Steve", last_name: "O"
    Given I am on root
    And I fill in "search" with "John"
    When I check "checkall"
    When I press "delete selected contacts"
    And I confirm
    And a contact should not exist with id: 1, first_name: "Johnny", last_name: "Knoxville"
    And a contact should not exist with id: 2, first_name: "Johnny", last_name: "Cash"
    And a contact should exist with id: 3, first_name: "Steve", last_name: "O"

