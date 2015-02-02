require 'rails_helper'

RSpec.describe "consumption_types/edit", :type => :view do
  before(:each) do
    @consumption_type = assign(:consumption_type, ConsumptionType.create!(
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders the edit consumption_type form" do
    render

    assert_select "form[action=?][method=?]", consumption_type_path(@consumption_type), "post" do

      assert_select "input#consumption_type_title[name=?]", "consumption_type[title]"

      assert_select "input#consumption_type_user_id[name=?]", "consumption_type[user_id]"
    end
  end
end
