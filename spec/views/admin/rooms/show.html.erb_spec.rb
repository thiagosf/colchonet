require 'spec_helper'

describe "admin/rooms/show" do
  before(:each) do
    @admin_room = assign(:admin_room, stub_model(Admin::Room,
      :title => "Title",
      :location => "Location",
      :description => "Description",
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Location/)
    rendered.should match(/Description/)
    rendered.should match(/Picture/)
  end
end
