And(/^I follow "([^"]*)" within "([^"]*)"$/) do |link, element|
  within(element) do
    click_link(link)
  end
end

Then(/^I should see "([^"]*)" within "([^"]*)"$/) do |text, element|
  within(element) do
    page.should have_content(text)
  end
end