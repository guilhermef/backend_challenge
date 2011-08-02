Feature: Contact list
  Scenario: See contacts in alphabetical order
    Given 15 contacts exist
    And I am on root
		Then 	I see all contacts in alphabetical order
		
  Scenario: See contacts in alphabetical order
    Given I am on root
    When I press "add contact"
		And I fill in "contact[fist_name]" with "Axl"
		And I fill in "contact[middle_name]" with "fucking"
		And I fill in "contact[last_name]" with "Rose"
    # When I press "add number"
    # And I fill in "contact[phone_numer[number]]" with "(123)-123-4567"
    # And I fill in "contact[phone_numer[number]]" with "(123)-123-4567"
    When I press "save"
    Then a contact should exist with first_name: "Axl", middle_name: "fucking", last_name: "Rose"