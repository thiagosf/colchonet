require 'spec_helper'

describe "Admin::Rooms" do
  describe "GET /admin_rooms" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_rooms_path
      response.status.should be(200)
    end
  end
end