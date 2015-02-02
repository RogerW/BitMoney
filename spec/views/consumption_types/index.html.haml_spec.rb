require 'rails_helper'

RSpec.describe "consumption_types/index", :type => :view do
  before(:each) do
    assign(:consumption_types, [
      ConsumptionType.create!(
        :title => "Title",
        :user => nil
      ),
      ConsumptionType.create!(
        :title => "Title",
        :user => nil
      )
    ])
  end

  it "renders a list of consumption_types" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
