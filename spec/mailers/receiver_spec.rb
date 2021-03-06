require "spec_helper"
include Devise::TestHelpers

describe Receiver do
 it "parses a reply form a commnet update into a comment" do
   comment = FactoryGirl.create(:comment)
   ticket = comment.ticket
   comment_email = ActionMailer::Base.deliveries.last
   user =  FactoryGirl.create(:confirmed_user)
   mail = Mail.new(
     from: user.email,
     subject: "Re: #{comment_email.subject}",
     body: %Q{This is a brand new comment #{comment_email.default_part_body}},
     to: comment_email.from)  
   lambda { Receiver.parse(mail) }.should(change(ticket.comments, :count).by(1))
 end
end 
  
