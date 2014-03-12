require 'spec_helper'

describe "Tickets" do
 


  let!(:user) { FactoryGirl.create(:confirmed_user) }
  let!(:project) { FactoryGirl.create(:project, name: "TextMate 2") }
  let!(:ticket) { FactoryGirl.create(:ticket, :project => project,
                                   :user => user) }

  before do
    define_permission!(user, :view, project)
    sign_in_as!(user)
    visit '/'
    click_link project.name
    click_link ticket.title
  end

  context "Ticket watch toggling" do
   
   it "should have user in watch list" do
      page.should have_selector('li', text: user.email)
    end
  end

  # describe "GET /tickets" do
    # it "works! (now write some real specs)" do
      # # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # get tickets_path
      # response.status.should be(200)
    # end
  # end
end
