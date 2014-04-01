require 'spec_helper'

describe "admin/users/edit" do
  before(:each) do
    @admin_user = assign(:admin_user, stub_model(Admin::User,
      :full_name => "MyString",
      :email => "MyString",
      :location => "MyString",
      :bio => "MyString"
    ))
  end

  it "renders the edit admin_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_user_path(@admin_user), "post" do
      assert_select "input#admin_user_full_name[name=?]", "admin_user[full_name]"
      assert_select "input#admin_user_email[name=?]", "admin_user[email]"
      assert_select "input#admin_user_location[name=?]", "admin_user[location]"
      assert_select "input#admin_user_bio[name=?]", "admin_user[bio]"
    end
  end
end
