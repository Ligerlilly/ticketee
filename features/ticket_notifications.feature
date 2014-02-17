Feature: Ticket Notifications
  Background: 
    Given there are the following users:
      | email              | password |
      | alice@ticketee.com | password |
     
    
    Given a clear email queue
    
    Given there is a project called "TextMate 2"
    And "alice@ticketee.com" can view the "TextMate 2" project
    And "alice@ticketee.com" has created a ticket for this project:
      | title        | description      |      
      | Release date | TBA very shortly |
    Given there are the following users:
      | email              | password |
      | user@ticketee.com   | password |
    And I am signed in as them
    And "user@ticketee.com" can view the "TextMate 2" project
    Given I am on the homepage
   
    
  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"
    
    
    
    When "alice@ticketee.com" opens the email
    
    And they should see "[ticketee] TextMate 2 - Release date" in the email subject
    Then they click the first link in the email
    Then I should see "Release date" within "#ticket h2"
    
    
   