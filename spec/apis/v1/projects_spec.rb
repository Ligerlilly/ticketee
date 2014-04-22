 
 
 
  require "spec_helper"
  include Devise::TestHelpers
 
  describe "/api/v1/projects", :type => :api do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:token) { user.authentication_token }
    let!(:project) { FactoryGirl.create(:project) }

    before do
      user.permissions.create!(:action => "view", :thing => project)
    end

    context "projects viewable by this user" do

      before do
        FactoryGirl.create(:project, :name => "Access Denied")
      end

      let(:url) { "/api/v1/projects" }
      it "json" do
        get "#{url}.json", :token => token

        projects_json = Project.for(user).all.to_json
        last_response.body.should eql(projects_json)
        last_response.status.should eql(200)

        projects = JSON.parse(last_response.body)

        projects.any? do |p|
          p["name"] == project.name
        end.should be_true

        projects.any? do |p|
          p["name"] == "Access Denied"
        end.should be_false
      end
      
      it "XML" do
        get "#{url}.xml", token: token
        last_response.body.should eql(Project.for(user).to_xml)
        projects = Nokogiri::XML(last_response.body)
        projects.css("project name").text.should eql("Ticketee")
      end
    end
  end
