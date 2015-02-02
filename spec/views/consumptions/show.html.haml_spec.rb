require 'rails_helper'

RSpec.describe "consumptions/show", :type => :view do
  before(:each) do
    @consumption = assign(:consumption, Consumption.create!(
      :invoice => nil,
      :consumption_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
