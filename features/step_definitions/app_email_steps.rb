Then(/^the email should contain (\d+) parts$/) do |num|
  current_email.parts.size.should eql(num.to_i)
end

Then(/^there should be a part with the content type "([^"]*)"$/) do |content_type|
  current_email.parts.detect do |p|
     p.content_type.include?(content_type)
  end.should_not be_nil
end

Given(/^Action Mailer delivers via SMTP$/) do
  ActionMailer::Base.delivery_method = :smtp
end

When(/^I log into gmail with:$/) do |table|
 details = table.hashes.first
 @gmail = Gmail.connect(details["user_name"], details["password"])
 @gmail.logout
end

Then(/^there should be an email from Ticketee in my inbox$/) do
  @gmail_reconnect = Gmail.connect("jaysunlane@gmail.com", "ligerlilly0")
  @mails = @gmail_reconnect.inbox.find(:unread) 
  @mails.each do |mail|
    if mail.message.subject = "[ticketee] TextMate 2 - Release date"
     mail.delete!
     @received_mail = true
    end 
  end
  @received_mail.should be_true
  @gmail_reconnect.logout
end
