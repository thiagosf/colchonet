require 'spec_helper'

describe "admin/rooms/edit" do
  before(:each) do
    @admin_room = assign(:admin_room, stub_model(Admin::Room,
      :title => "MyString",
      :location => "MyString",
      :description => "MyString",
      :picture => "MyString"
    ))
  end

  it "renders the edit admin_room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_room_path(@admin_room), "post" do
      assert_select "input#admin_room_title[name=?]", "admin_room[title]"
      assert_select "input#admin_room_location[name=?]", "admin_room[location]"
      assert_select "input#admin_room_description[name=?]", "admin_room[description]"
      assert_select "input#admin_room_picture[name=?]", "admin_room[picture]"
    end
  end
end
