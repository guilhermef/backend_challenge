Feature: Contact list
  Scenario: See validation error messages
    Given 15 contacts exist
    And I am on root
		Then 	I see all contacts in alphabetical order