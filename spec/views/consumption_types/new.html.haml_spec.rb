require 'rails_helper'

RSpec.describe "consumption_types/new", :type => :view do
  before(:each) do
    assign(:consumption_type, ConsumptionType.new(
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders new consumption_type form" do
    render

    assert_select "form[action=?][method=?]", consumption_types_path, "post" do

      assert_select "input#consumption_type_title[name=?]", "consumption_type[title]"

      assert_select "input#consumption_type_user_id[name=?]", "consumption_type[user_id]"
    end
  end
end
