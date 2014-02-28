require "spec_helper"
include Devise::TestHelpers
describe Notifier do
   let(:commenter) { FactoryGirl.create(:confirmed_user) }
    let(:ticket_owner) { FactoryGirl.create(:confirmed_user) }
    let(:project) { FactoryGirl.create(:project, name: "TextMate 2") }
 
    let(:ticket) { FactoryGirl.create(:ticket, project: project, user: ticket_owner, title: "Release date",
      description: "TBA very shortly") }
      
    let(:comment) do
       Comment.new({
          ticket: ticket,
          user: commenter,
          text: "Is it Ready yet?"
        }, without_protection: true)
    end
   
    let(:mail) { Notifier.comment_updated(comment, ticket_owner) }
    
    
  context "comment_update" do
   
    it "mail should be sent to ticket_owner" do
        mail.to.should include(ticket_owner.email)
        mail.subject.should include("[ticketee] TextMate 2 - Release date")     
    end
    
  end
  
  

   
end
