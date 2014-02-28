Feature: Ticket Notifications
  Background: 
    Given there are the following users:
      | email              | password |
      | admin@ticketee.com | password |
     
    
    Given a clear email queue
    
    Given there is a project called "TextMate 2"
    And "admin@ticketee.com" can view the "TextMate 2" project
    And "admin@ticketee.com" has created a ticket for this project:
      | title        | description      |      
      | Release date | TBA very shortly |
    Given there are the following users:
      | email               | password |
      | user@ticketee.com   | password |
    And I am signed in as them
    And "user@ticketee.com" can view the "TextMate 2" project
    Given I am on the homepage
   
    
  Scenario: Ticket owner is automatically subscribed to a ticket
    When I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Is it out yet?"
    And I press "Create Comment"
    
    
    
    When "admin@ticketee.com" opens the email
    
    And they should see "[ticketee] TextMate 2 - Release date" in the email subject
    Then they follow "view this ticket online here" in the email
    Then I should see "Release date" within "#ticket h2"
    
    And the email should contain 2 parts
    And there should be a part with the content type "text/plain"
    And there should be a part with the content type "text/html"
    
    
  Scenario: Comment authors are automatically subcribed to a ticket
    When I follow "TextMate 2" 
    And I follow "Release date"
    And I fill in "Text" with "is is out yet?"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    When I follow "Sign out"
    
    Given a clear email queue
    
    Given I am signed in as "admin@ticketee.com"
    
    When I follow "TextMate 2"
    And I follow "Release date"
    And I fill in "Text" with "Not Yet!"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    Then "user@ticketee.com" should receive an email
    Then "alice@tickee.com" should have no emails
    
  
    
    
   