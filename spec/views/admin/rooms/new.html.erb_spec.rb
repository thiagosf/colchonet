require 'spec_helper'

describe "admin/rooms/new" do
  before(:each) do
    assign(:admin_room, stub_model(Admin::Room,
      :title => "MyString",
      :location => "MyString",
      :description => "MyString",
      :picture => "MyString"
    ).as_new_record)
  end

  it "renders new admin_room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_rooms_path, "post" do
      assert_select "input#admin_room_title[name=?]", "admin_room[title]"
      assert_select "input#admin_room_location[name=?]", "admin_room[location]"
      assert_select "input#admin_room_description[name=?]", "admin_room[description]"
      assert_select "input#admin_room_picture[name=?]", "admin_room[picture]"
    end
  end
end
