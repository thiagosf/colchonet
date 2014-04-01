require 'spec_helper'

describe "admin/users/index" do
  before(:each) do
    assign(:admin_users, [
      stub_model(Admin::User,
        :full_name => "Full Name",
        :email => "Email",
        :location => "Location",
        :bio => "Bio"
      ),
      stub_model(Admin::User,
        :full_name => "Full Name",
        :email => "Email",
        :location => "Location",
        :bio => "Bio"
      )
    ])
  end

  it "renders a list of admin/users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Bio".to_s, :count => 2
  end
end
