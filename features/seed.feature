Feature: Seed data
  In order to fill database with the basics
  as the system
  I want to run the seed task
  
  Scenario: The basics
    Given I have run the seed task
    And I am signed in as "admin@ticketee.com"
    Then I should see "Ticketee Beta"