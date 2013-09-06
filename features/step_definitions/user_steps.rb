Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
    admin = attributes.delete("admin") == "true"
    @user = User.create!(attributes)
    @user.update_attribute("admin", "true") if admin
    @user.confirm! unless unconfirmed
  end
end

Given /^I am signed in as them$/ do 
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
  end

Given /^I am signed in as admin$/ do 
  steps(%Q{
    Given I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "admin@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
  end
  
Given /^I am signed in as "([^\"]*)"$/ do |email|
  @user = User.find_by_email!(email)
  steps("Given I am signed in as them") if email == "user@ticketee.com"
  steps("Given I am signed in as admin") if email == "admin@ticketee.com"
end