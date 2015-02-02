require 'rails_helper'

RSpec.describe "consumptions/index", :type => :view do
  before(:each) do
    assign(:consumptions, [
      Consumption.create!(
        :invoice => nil,
        :consumption_type => nil
      ),
      Consumption.create!(
        :invoice => nil,
        :consumption_type => nil
      )
    ])
  end

  it "renders a list of consumptions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
