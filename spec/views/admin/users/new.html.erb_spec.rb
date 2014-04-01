require 'spec_helper'

describe "admin/users/new" do
  before(:each) do
    assign(:admin_user, stub_model(Admin::User,
      :full_name => "MyString",
      :email => "MyString",
      :location => "MyString",
      :bio => "MyString"
    ).as_new_record)
  end

  it "renders new admin_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_users_path, "post" do
      assert_select "input#admin_user_full_name[name=?]", "admin_user[full_name]"
      assert_select "input#admin_user_email[name=?]", "admin_user[email]"
      assert_select "input#admin_user_location[name=?]", "admin_user[location]"
      assert_select "input#admin_user_bio[name=?]", "admin_user[bio]"
    end
  end
end
