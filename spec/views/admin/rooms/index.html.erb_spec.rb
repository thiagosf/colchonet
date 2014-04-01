require 'spec_helper'

describe "admin/rooms/index" do
  before(:each) do
    assign(:admin_rooms, [
      stub_model(Admin::Room,
        :title => "Title",
        :location => "Location",
        :description => "Description",
        :picture => "Picture"
      ),
      stub_model(Admin::Room,
        :title => "Title",
        :location => "Location",
        :description => "Description",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of admin/rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
