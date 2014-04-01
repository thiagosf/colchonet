require 'spec_helper'

describe "admin/users/show" do
  before(:each) do
    @admin_user = assign(:admin_user, stub_model(Admin::User,
      :full_name => "Full Name",
      :email => "Email",
      :location => "Location",
      :bio => "Bio"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Full Name/)
    rendered.should match(/Email/)
    rendered.should match(/Location/)
    rendered.should match(/Bio/)
  end
end
